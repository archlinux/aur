# Maintainer: Modelmat <modelmat@outlook.com.au>

pkgname=wpilib-utility
_pkgver=2021.2.2
pkgver=${_pkgver//-/_}
pkgrel=3
pkgdesc="Standalone FRC Robot Project Builder"
arch=("x86_64")
url="https://github.com/wpilibsuite/vscode-wpilib"
license=("custom:FIRST")
provides=("wpilib-utility")
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/wpilibsuite/vscode-wpilib/releases/download/v$_pkgver/wpilibutility-linux.tar.gz"
        "wpilib-utility.desktop")
md5sums=("6ac435258eb7c3f38bf49ac4c4ba8a53"
         "08845bf8556c697ab7de3daf16c9487b")

package() {
  mkdir -p "${pkgdir}/opt/$pkgname" "${pkgdir}/usr/bin"
  tar -zxf "${srcdir}/${pkgname}-${_pkgver}.tar.gz" -C "${pkgdir}/opt/$pkgname"

  install -Dm644 "${srcdir}/resources/app/wpilib.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wpilib-utility.svg"
  install -Dm644 "${srcdir}/wpilib-utility.desktop" "${pkgdir}/usr/share/applications/wpilib-utility.desktop"

  ln -s /opt/$pkgname/wpilibutility "${pkgdir}/usr/bin/$pkgname"
}
