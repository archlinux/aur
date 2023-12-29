# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Your Name <abrahammurciano at gmail dot com>
_base=agena
pkgname=${_base}-bin
pkgver=3.7.6
pkgrel=1
pkgdesc="An Algol-inspired procedural programming language designed for science, scripting, and other applications"
arch=(x86_64)
url="https://${_base}.sourceforge.net"
license=(GPL)
depends=(libxext ncurses readline)
source=(${pkgname}-${pkgver}.deb::https://master.dl.sourceforge.net/project/${_base}/Binaries/Agena%20${pkgver}/${_base}-${pkgver}a-linux.amd64.deb
  ${_base}.desktop)
sha512sums=('c1e61200dcc3d3fdc17836c3a45274bb627d0b6c228fe85c11966b4c6c78b9a64562172c430bf01d8215c9b7f45a34f725a22945657eb4cbc67816650fdb4d0b'
  'fb5ab7b3922977b770e4b8b29528aad9fe6c2666721c3ebefdf385ddb95abc68c2f3a22eb26fda68088301f9118eefc39997432198ecf2763eff1ac49b063848')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  install -Dm 755 usr/local/bin/agena -t "${pkgdir}/usr/bin"
  install -Dm 644 usr/local/lib/libagena.so -t "${pkgdir}/usr/lib32"
  install -Dm 644 agena.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 usr/agena/share/icons/agenasmall.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/agena.png"
  install -Dm 644 usr/agena/share/icons/agena.png -t "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
  install -Dm 644 usr/agena/share/icons/agena64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/agena.png"
  install -Dm 644 usr/agena/share/icons/agena128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/agena.png"
}
