# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Your Name <abrahammurciano at gmail dot com>
_base=agena
pkgname=${_base}-bin
pkgver=6.1.0
pkgrel=1
pkgdesc="An Algol-inspired procedural programming language designed for science, scripting, and other applications"
arch=(x86_64)
url="https://${_base}.sourceforge.net"
license=(GPL-2.0-or-later)
depends=(libxext ncurses readline)
source=(${pkgname}-${pkgver}.deb::https://master.dl.sourceforge.net/project/${_base}/Binaries/Agena%20${pkgver}/${_base}-${pkgver}-linux.amd64.deb
  ${_base}.desktop)
sha512sums=('1b74c39726c85bcc3355df0fdc69683667462501d37fceca891509c7cbff931ffc37916220bc216f128345b307196498798b5a4d9eb7260dc25bedb3222fe239'
            'fb8c658430b1eac995bcf8a91273170986740b66eb4988f945fb2d0969b64b47cec2cc1dfdd3d71863afcd9d8efaebde04a5ffd78589544068a930c6bcd923a4')

prepare() {
  bsdtar xf data.tar.zst
}

package() {
  install -Dm 755 usr/local/bin/agena -t "${pkgdir}/usr/bin"
  install -Dm 755 usr/local/lib/libagena.so -t "${pkgdir}/usr/lib"
  install -Dm 644 agena.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 usr/agena/share/icons/agenasmall.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/agena.png"
  install -Dm 644 usr/agena/share/icons/agena.png -t "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
  install -Dm 644 usr/agena/share/icons/agena64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/agena.png"
  install -Dm 644 usr/agena/share/icons/agena128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/agena.png"
}
