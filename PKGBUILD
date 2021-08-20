#!/usr/bin/env bash
# Maintainer: Underports Software
# Contributor: Aleksey Sh aur <at> pivko.codes
pkgname=meridius-electron-bin
pkgver=1.9.3
pkgrel=1
epoch=1
arch=('x86_64')
url="https://purplehorrorrus.github.io/meridius"
license=('custom')
source=(https://github.com/PurpleHorrorRus/Meridius/releases/download/v${pkgver}/meridius-${pkgver}.deb)
sha512sums=('5e7b21ab6a070280a038090a2a4f41590d3593eb8d0382db1ba8b80786507c52b6ec4615df3b4658db8d318864281a01cabf2b3867a989edbc9a2b9782348572')

package_meridius-electron-bin() {

    depends=('electron' 'libxss' 'libxtst' 'at-spi2-core' 'util-linux-libs' 'libsecret')
    arch=('x86_64')
    pkgdesc="Music Player for vk.com based on Electron, NuxtJS, Vue. (System Electron)"
    provides=('meridius')

        mkdir -p ${pkgdir}/usr/share/Meridius
        mkdir -p ${pkgdir}/usr/share/icons/hicolor/256x256/apps
        mkdir -p ${pkgdir}/usr/share/applications

            bsdtar -xvf data.tar.xz ./opt/Meridius/resources/app.asar ./usr/share/applications/meridiusreborn.desktop ./usr/share/icons/hicolor/256x256/apps/meridiusreborn.png

        sed -i 's!/opt/Meridius/meridiusreborn!electron /usr/share/Meridius/app.asar!' usr/share/applications/meridiusreborn.desktop
        sed -i 's!Audio;!Audio;Music;Player;AudioVideo;!' usr/share/applications/meridiusreborn.desktop

        mv usr/share/icons/hicolor/256x256/apps/meridiusreborn.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps
        mv usr/share/applications/meridiusreborn.desktop ${pkgdir}/usr/share/applications
        mv opt/Meridius/resources/app.asar ${pkgdir}/usr/share/Meridius

}
