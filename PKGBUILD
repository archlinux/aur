# Maintainer: Modelmat <modelmat@outlook.com.au>

pkgname=wpilib-utility
# Change to 2020.1.1-beta-2 for the 2020 beta
pkgver=2019.4.2
pkgrel=1
pkgdesc="Standalone FRC Robot Project Builder"
arch=("x86_64")
url="https://github.com/wpilibsuite/vscode-wpilib"
license=("custom:FIRST")
provides=("wpilib-utility")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wpilibsuite/vscode-wpilib/releases/download/v$pkgver/wpilibutility-linux.tar.gz"
        "wpilib-128.png"
        "wpilib-utility.desktop")
md5sums=("c9f91f4c2864934c2180f594ba6f5c08"
         "b941b01eab5ec05e6723360099fd0f03"
         "08845bf8556c697ab7de3daf16c9487b")

package() {
  mkdir -p "${pkgdir}/opt/$pkgname" "${pkgdir}/usr/bin"
  tar -zxf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/$pkgname"
  
  install -Dm644 "${srcdir}/wpilib-128.png" "${pkgdir}/usr/share/pixmaps/wpilib-utility.png"
  install -Dm644 "${srcdir}/wpilib-utility.desktop" "${pkgdir}/usr/share/applications/wpilib-utility.desktop"
  
  ln -s /opt/$pkgname/wpilibutility "${pkgdir}/usr/bin/$pkgname"
}
