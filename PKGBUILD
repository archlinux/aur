# Maintainer: Jesper Jensen <jesper@slashwin.dk>
pkgname=python-borgmatic-git
pkgver=1.1.7.r3.gf3d6d7c
pkgrel=2
pkgdesc="a simple Python wrapper script for the Borg backup software"
arch=('any')
url="https://github.com/witten/borgmatic.git"
license=('GPL3')
groups=()
depends=('python' 'python-pykwalify' 'python-ruamel-yaml<=0.15.0' 'python-setuptools')
makedepends=('git')
checkdepends=('python-flexmock' 'python-pytest')
provides=('borgmatic')
conflicts=('borgmatic')
replaces=()
backup=()
options=(!emptydirs)
install=
source=('git+https://github.com/witten/borgmatic.git')
md5sums=('SKIP')

pkgver() {
  cd "borgmatic"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/borgmatic"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check() {
  cd "$srcdir/borgmatic"
  python setup.py test
}

# vim:set ts=2 sw=2 et:
