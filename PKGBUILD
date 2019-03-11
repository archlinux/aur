# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Pawel "kTT" Salata <rockplayer.pl@gmail.com>

pkgname=('python2-pycountry')
pkgver=18.12.8
pkgrel=2
pkgdesc="ISO country, subdivision, language, currency and script definitions and their translations"
arch=('any')
url="https://pypi.org/project/pycountry/"
license=('LGPL2.1')
makedepends=('python2' 'python2-setuptools')
checkdepends=('python2-pytest' 'python2-pytest-runner')
source=("https://pypi.io/packages/source/p/pycountry/pycountry-${pkgver}.tar.gz")
sha512sums=('9797688ada8ea54c1a56a2cf4d0ad765001816c822c40077953fa71e3af285114c4b5beaf739a24432b9c6ea794952ce347a40ae0bcd9a2c00d12ddc7b45261e')

build(){
  cd "${srcdir}/pycountry-${pkgver}"
  python2 setup.py build
}

check(){
  cd "${srcdir}/pycountry-${pkgver}"
  python2 setup.py pytest
}


package_python2-pycountry() {
  depends=('python2' 'python2-lxml')
  cd "${srcdir}/pycountry-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
