# Maintainer: capi_x < capi_x at haibane.org >

pkgname=otpnitro
pkgdesc='OTP Nitro is a secure One Time Pad library and CLI to use on computers.'
pkgver=0.5.2
pkgrel=1
arch=('i686' 'x86_64' 'armv6h')
url='http://code.haibane.org/capi_x/otpnitro'
license=('GPL3')
source=("http://code.haibane.org/capi_x/otpnitro/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/otpnitro-${pkgver}"
  make -j1
}

package() {
  cd "${srcdir}/otpnitro-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib"

  make PREFIX="${pkgdir}/usr" install
}

md5sums=('d7b8cef8a3e0bf0b38620bbf05ea5a1d')
