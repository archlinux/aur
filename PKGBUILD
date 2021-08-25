#!/usr/bin/env bash
# Maintainer: Underports Software
# Contributor: Aleksey Sh aur <at> pivko.codes
pkgname=meridius-electron-bin
pkgver=1.9.4
pkgrel=1
epoch=1
arch=('x86_64')
url="https://purplehorrorrus.github.io/meridius"
license=('custom')
source=(https://github.com/PurpleHorrorRus/Meridius/releases/download/v${pkgver}/meridius-${pkgver}.deb)
sha512sums=('75739cb3ae27f01cacff227be3306054c2dae7a7e895dc18d2a797823d74d3ccb348c73e9a9c01a1dac4e74083060ff090c78a1a975ba5cfddf44d07e4a1ca91')

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
