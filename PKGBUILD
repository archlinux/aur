pkgname=python2-anolis
pkgver=r452.bb7e0d4b8463
pkgrel=1
pkgdesc="HTML TOC generator"
arch=(i686 x86_64)
url="https://bitbucket.org/ms2ger/anolis"
license=('MIT')
depends=('python2' 'python2-lxml' 'python2-html5lib' 'python2-cssselect')
makedepends=('python2-setuptools')
source=("$pkgname::hg+https://bitbucket.org/ms2ger/anolis")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --prefix=/usr \
                          --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
