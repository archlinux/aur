# Maintainer: capi_x < capi_x at haibane.org >

pkgname=qotpnitro
pkgdesc='OTP Nitro GUI is a secure One Time Pad implementation to use on computers with Qt.'
pkgver=0.5.2
pkgrel=1
arch=('i686' 'x86_64')
url='http://code.haibane.org/capi_x/otpnitro'
license=('GPL3')
depends=('qt5-base' 'otpnitro')
source=("http://code.haibane.org/capi_x/otpnitro/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/otpnitro-${pkgver}/${pkgname}"
  qmake
  make
}

package() {
  cd "${srcdir}/otpnitro-${pkgver}/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/applications/"

  install -Dm755 "${srcdir}/otpnitro-${pkgver}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/otpnitro-${pkgver}/packages/debian/qotpnitro/usr/share/qotpnitro/main_icon_64.png" "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 "${srcdir}/otpnitro-${pkgver}/packages/debian/qotpnitro/usr/share/qotpnitro/main_icon_48.png" "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 "${srcdir}/otpnitro-${pkgver}/packages/debian/qotpnitro/usr/share/qotpnitro/main_icon_32.png" "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 "${srcdir}/otpnitro-${pkgver}/packages/debian/qotpnitro/usr/share/qotpnitro/main_icon_16.png" "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 "${srcdir}/otpnitro-${pkgver}/packages/debian/qotpnitro/usr/share/applications/OTPNitro.desktop" "${pkgdir}/usr/share/applications/"
}

md5sums=('d7b8cef8a3e0bf0b38620bbf05ea5a1d')

#mkdir -p "${pkgdir}/usr/bin"
#mkdir -p "${pkgdir}/usr/lib"
#make PREFIX="${pkgdir}/usr" install

