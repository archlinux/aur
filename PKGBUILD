# Maintainer: gpaitoo <fpaitoo@gmail.com>
pkgname=pangoterm-bin
pkgver=1.0.4
pkgrel=1
pkgdesc='Modern cross-platform SSH client with SFTP, port forwarding, and terminal emulation'
arch=('x86_64')
url='https://pangoterm.com'
license=('LicenseRef-PangoTerm-Proprietary')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'openssl'
  'libayatana-appindicator'
  'librsvg'
)
provides=('pangoterm')
conflicts=('pangoterm')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://github.com/fpaitoo/pangoterm-releases/releases/download/v${pkgver}/PangoTerm_${pkgver}_amd64.deb")
sha256sums=('1f31fafb34206291bd76d97b8b3ad43ba0fc266e9772281fbc6d317a12be2139')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"

  install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo "Proprietary license. See https://pangoterm.com/terms" > \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
