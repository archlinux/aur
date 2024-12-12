# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Your Name <abrahammurciano at gmail dot com>
_base=agena
pkgname=${_base}-bin
pkgver=4.6.2
pkgrel=1
pkgdesc="An Algol-inspired procedural programming language designed for science, scripting, and other applications"
arch=(x86_64)
url="https://${_base}.sourceforge.net"
license=(GPL-2.0-or-later)
depends=(libxext ncurses readline)
source=(${pkgname}-${pkgver}.deb::https://master.dl.sourceforge.net/project/${_base}/Binaries/Agena%20${pkgver}/${_base}-${pkgver}-linux.amd64.deb
  ${_base}.desktop)
sha512sums=('59fc1e4a54b2ebf3adc9b9565fc5a3f5207704d237b69144a428f4db177f5cf5ea73bac4267c2855101fd5538014a28c894e9d7152e42845213e604a29700027'
            '813d95d40e351b9df43ef0bce93214b659ff851f81cb403a88e5bbddcb6f8e120ce216df3cb38ce3b5c2e11c498c68314b72d25ed17ae8158f420b560b626de2')

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
