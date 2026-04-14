# Maintainer: Milen <stefanov.m@ati.su>
_basename=time-desktop
_baseurl=https://downloads.time-messenger.ru
pkgname=${_basename}-bin
epoch=1
pkgver=5.28.0
pkgrel=1
pkgdesc="TiMe (Tinkoff Messenger) is a corporate messenger based on Mattermost. This package provides the Linux desktop application."
arch=('x86_64')
url="${_baseurl}/desktop/linux/time-desktop-linux-x64.tar.gz"
license=('Apache License, Version 2.0')
depends=('glibc')
source=("${_baseurl}/desktop/linux/time-desktop-linux-x64.tar.gz" "time.desktop")
sha256sums=('c2068c26721ba3d2b8e2deee5faaa73dc363c1377bb6af229aecff3363fbdc22'
            'e49a5ddfdcf71aa178c991f0f7514009a7ec45afe9b6776795873586e7412fb5')

package() {
    install -d "${pkgdir}/opt/${_basename}"
    cp -r "${srcdir}/${_basename}-${pkgver}-linux-x64/"* "${pkgdir}/opt/${_basename}/"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_basename}/Time" "${pkgdir}/usr/bin/Time"

    install -Dm644 "${srcdir}/${_basename}-${pkgver}-linux-x64/app_icon.png" "${pkgdir}/usr/share/pixmaps/time-desktop.png"
    install -Dm644 "${srcdir}/${_basename}-${pkgver}-linux-x64/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"

    install -Dm644 "${srcdir}/time.desktop" "${pkgdir}/usr/share/applications/time.desktop"
}

