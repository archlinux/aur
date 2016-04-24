# Maintainer: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=cppman
pkgver=0.4.7
pkgrel=1
pkgdesc="C++ 98/11/14 manual pages for Linux/MacOS"
arch=('any')
url="https://github.com/aitjcize/cppman"
license=('GPL')
conflicts=(cppman-git)
depends=(python3 vim groff python-beautifulsoup4 python-html5lib)
source=("https://pypi.python.org/packages/source/c/cppman/${pkgname}-${pkgver}.tar.gz")
source=("https://pypi.python.org/packages/e6/36/1d1c96e510a9e5b7c62da33279a9dba57652d24564273ae64ad1fc3d5dd3/${pkgname}-${pkgver}.tar.gz")
md5sums=('4c95a88f8f2ef387bd23e8a637f33584')


build() {
  cd ${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python3 setup.py install --root=${pkgdir}/ --optimize=1
}
