# Maintainer: H3CoF6 <h3cof6@gmail.com>
pkgname=weflow
pkgver=5.1.0
pkgrel=1
pkgdesc="A local WeChat database decryption and analysis tool"
arch=('x86_64')
url="https://github.com/hicccc77/weflow"
license=('CC-BY-NC-SA-4.0')
depends=('alsa-lib' 'gtk3' 'nss' 'glibc')
options=('!strip' '!debug')

source=("WeFlow-${pkgver}-Setup.tar.gz::${url}/releases/download/v${pkgver}/WeFlow-${pkgver}-Setup.tar.gz"
  "weflow.desktop"
  "icon.png")

sha256sums=('cf4edc0f6f79b390722455a672da2e4c27860934be0caeb20171d8e6eac953eb'
            '2cf03766f5c2f1915ad136f060a66f5788ed32b06defe1956e406c73d7e733b7'
            'b1c412d9c08ae683e231173c16fe73958ad1063f14c9b3852373385e4fcb6f33')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"

  cp -a "${srcdir}/WeFlow-${pkgver}-Setup/"* "${pkgdir}/opt/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/weflow" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/weflow.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
