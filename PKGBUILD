# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Your Name <abrahammurciano at gmail dot com>
_base=agena
pkgname=${_base}-bin
pkgver=4.7.3
pkgrel=1
pkgdesc="An Algol-inspired procedural programming language designed for science, scripting, and other applications"
arch=(x86_64)
url="https://${_base}.sourceforge.net"
license=(GPL-2.0-or-later)
depends=(libxext ncurses readline)
source=(${pkgname}-${pkgver}.deb::https://master.dl.sourceforge.net/project/${_base}/Binaries/Agena%20${pkgver}/${_base}-${pkgver}-linux.amd64.deb
  ${_base}.desktop)
sha512sums=('322071b324e2eb5948e364ffd7a1db86fa84a548884edc4fc32ad2e9a2c9a22c57c32a23461d3cf3312a38432475d11cf5094d1534b08b9ef287021a5575ad75'
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
