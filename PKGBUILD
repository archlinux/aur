# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=singcast
pkgver=1.13.11_beta6
pkgrel=2
pkgdesc="A clash GUI client based on Flutter"
arch=('x86_64')
url="https://github.com/mapleafgo/clash-for-flutter"
license=('MIT')
conflicts=(${pkgname})
provides=(${pkgname})
depends=('gtk3' 'libayatana-appindicator' 'polkit')
source_x86_64=(${pkgname}-${pkgver}-x86_64.zip::https://github.com/mapleafgo/clash-for-flutter/releases/download/v1.13.11-beta6/singcast-1.13.11-beta6-linux-amd64.zip
             singcast.desktop
             singcast.png)
_install_path="/opt/Singcast"

package() {
  install -dm755 "${pkgdir}${_install_path}"

  cp -a "${srcdir}/lib" "${pkgdir}${_install_path}/lib"
  cp -a "${srcdir}/data" "${pkgdir}${_install_path}/data"
  install -Dm755 "${srcdir}/singcast" "${pkgdir}/${_install_path}/singcast"

  install -dm755 "${pkgdir}/usr/bin"
  ln -snf "${pkgdir}/${_install_path}/singcast" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "singcast.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/singcast.png"
  install -Dm644 "singcast.desktop" "${pkgdir}/usr/share/applications/singcast.desktop"
}

sha256sums_x86_64=('31b2ea1fa84d7ff5fbe5fce128a19fe5a9bc2b553ba37e7cda4881fd478ca1f9'
                   'f14d52960b535f9d31d24f08e9b248f3f70f70bfadc4ea58bb57f4d12b711ee9'
                   '8f2794ab95c565c0a333b51893ac0f0e37db479b6ff4e0ce6ef510c4dc58cddd')
