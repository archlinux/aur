pkgname=pyneedle
pkgnameorig=pyneedle
pkgver=r77.ebd0d29c1b8f
pkgrel=1
pkgdesc="Convenient tool created to allow you to quickly search for files in your computer, using one of the supported search engines (i.e. tracker and recoll)"
arch=('any')
url="https://bitbucket.org/aperezmendez/pyneedle"
license=('MIT')
depends=('gtk3' 'python2-setuptools')
optdepends=('recoll' 'tracker')
options=(!emptydirs)
makedepends=('mercurial')
source=('hg+https://bitbucket.org/aperezmendez/pyneedle')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
