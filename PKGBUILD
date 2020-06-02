# Maintainer: motte <ettom22 at hotmail dot com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=cppman
pkgver=0.5.0
pkgrel=1
pkgdesc="C++ 98/11/14 manual pages for Linux/MacOS"
arch=('any')
url="https://github.com/aitjcize/cppman"
license=('GPL3')
conflicts=(cppman-git)
depends=(python3 vim python-beautifulsoup4 python-html5lib)


source=("https://pypi.python.org/packages/53/9a/4908e1de68541c43961bea068c7062e91f8c8b656ea5fcf6ce0d7138a702/${pkgname}-${pkgver}.tar.gz")
md5sums=('7aa0e08ddcdfce22a39005881aae9713')

build() {
  cd ${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python3 setup.py install --root=${pkgdir}/ --optimize=1
}
