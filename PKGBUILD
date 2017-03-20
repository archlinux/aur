# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-otp'
pkgver=1.0.0
pkgrel=1
pkgdesc='A pass extension for managing one-time-password (OTP) tokens.'
arch=('any')
url='https://github.com/tadfisher/pass-otp'
license=('GPL3')
depends=('pass'
         'oath-toolkit')
optdepends=('qrencode: for generating QR code images')
source=(https://github.com/tadfisher/pass-otp/archive/v${pkgver}.tar.gz)
sha512sums=('44f7ec9eb7ca8c5d153fd520fe55c6304bad59e208f56c84b73afbea7cec04d057d267373504786665cd77c5958a48b57938c8b3641de0b0e7f255f6afa81590')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
