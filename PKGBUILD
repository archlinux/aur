pkgname=python-pdbpp-git
_realname=pdbpp
pkgver=0.10.2.r169.gce0c181
pkgrel=1
pkgdesc="pdb++, a drop-in replacement for pdb"
arch=(any)
url="https://github.com/pdbpp/pdbpp"
license=('BSD')
depends=('python' 'python-fancycompleter' 'python-pygments')
optdepends=('python-pyrepl-hg')
options=(!emptydirs)
conflicts=('python-pdbpp')
provides=('python-pdbpp')
source=("git+https://github.com/pdbpp/pdbpp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_realname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_realname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
