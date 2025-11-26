# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Your Name <abrahammurciano at gmail dot com>
_base=agena
pkgname=${_base}-bin
pkgver=6.4.6
pkgrel=1
pkgdesc="An Algol-inspired procedural programming language designed for science, scripting, and other applications"
arch=(x86_64)
url="https://${_base}.sourceforge.net"
license=(GPL-2.0-or-later)
depends=(libxext ncurses readline)
source=(${pkgname}-${pkgver}.deb::https://master.dl.sourceforge.net/project/${_base}/Binaries/Agena%20${pkgver}/${_base}-${pkgver}-linux.amd64.deb
  ${_base}.desktop)
sha512sums=('159c2c7344e71f7ed34c0741f73af0ef6d7e4e51badb113743cc4d1081a8e1635630a706f7ae8f9ed848cb948cf4b1e476909501ae566a15a31f588ff0743b45'
            '193a8b8c98a9c2261acc820f76cbca8cb51e0182029d6e713605e9e1f8f9ab0238e852270d2f64908fd4497369f3e9004cd0bbdbc9098c50c63c3d08a867f299')

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
