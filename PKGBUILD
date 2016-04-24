# Maintainer: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=cppman
pkgver=0.4.8
pkgrel=1
pkgdesc="C++ 98/11/14 manual pages for Linux/MacOS"
arch=('any')
url="https://github.com/aitjcize/cppman"
license=('GPL')
conflicts=(cppman-git)
depends=(python3 vim groff python-beautifulsoup4 python-html5lib)
source=("https://pypi.python.org/packages/f9/e8/5bad33a672a4687955d53200edcf4f724443ab47fe4e6bffd39a9f2fceeb/${pkgname}-${pkgver}.tar.gz")
md5sums=('5afb23a5731bc05f6f992c7bef9f28c2')



build() {
  cd ${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python3 setup.py install --root=${pkgdir}/ --optimize=1
}
