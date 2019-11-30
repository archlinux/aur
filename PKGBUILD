# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: yubimusubi <possum plus aur at possum dot cc>

pkgname=3dsconv
pkgver=4.2
pkgrel=1
pkgdesc='Convert Nintendo 3DS files to the CIA format'
arch=('any')
url="https://github.com/ihaveamac/3dsconv"
license=('MIT')
depends=('python-pyaes')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ihaveamac/3dsconv/archive/v${pkgver}.tar.gz")
sha256sums=('3e8d15f22a81189cb24459e3bd659b38e9f92ae957a4fae6f00af194ba0645f7')

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
