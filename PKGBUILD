# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=singcast
epoch=1
pkgver=1.1.0_beta6
pkgrel=1
pkgdesc="A clash GUI client based on Flutter"
arch=('x86_64')
url="https://github.com/mapleafgo/clash-for-flutter"
license=('MIT')
conflicts=(${pkgname})
provides=(${pkgname})
depends=('gtk3' 'libayatana-appindicator' 'polkit')
source_x86_64=(${pkgname}-${pkgver}-x86_64.zip::https://github.com/mapleafgo/clash-for-flutter/releases/download/v1.1.0-beta6/singcast-1.1.0-beta6-linux-amd64.zip
             singcast.desktop
             singcast.svg)
_install_path="/opt/Singcast"

package() {
  install -dm755 "${pkgdir}${_install_path}"

  cp -a "${srcdir}/lib" "${pkgdir}${_install_path}/lib"
  cp -a "${srcdir}/data" "${pkgdir}${_install_path}/data"
  install -Dm755 "${srcdir}/singcast" "${pkgdir}${_install_path}/singcast"
  install -Dm755 "${srcdir}/singcast-core" "${pkgdir}${_install_path}/singcast-core"

  install -dm755 "${pkgdir}/usr/bin"
  ln -snf "${pkgdir}/${_install_path}/singcast" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "singcast.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/singcast.svg"
  install -Dm644 "singcast.desktop" "${pkgdir}/usr/share/applications/singcast.desktop"
}

sha256sums_x86_64=('9a05eeaba1c43cceacc96f7015f041762ddde0d4afc6cf52c3d745d4fde4d1d2'
                   'f14d52960b535f9d31d24f08e9b248f3f70f70bfadc4ea58bb57f4d12b711ee9'
                   '289d9ffd1ea9b24928bea1a0936d9a1125e7f3d9e2d7341e353ce5c42d405f09')
