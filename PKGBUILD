# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-otp'
pkgver=0.1.0
pkgrel=2
pkgdesc='A pass extension for managing one-time-password (OTP) tokens.'
arch=('any')
url='https://github.com/tadfisher/pass-otp'
license=('GPL3')
depends=('pass'
         'oath-toolkit')
optdepends=('qrencode: for generating QR code images')
source=(https://github.com/tadfisher/pass-otp/archive/v${pkgver}.tar.gz)
sha512sums=('fd11baf5c41a3b7579e5f338345166f39d9fdef585d7b374f4879ac7ae5c5df68e9914fcc6ee34ca808036638f3d693d05dff7abef411a93222d9d9453aad88b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
