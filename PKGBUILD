# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=moondust-project-stable-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Moondust Project (formerly known as PGE Project) is a free and open-source game engine and development kit for it, giving developers the ability to create platform games. (Binary package - stable branch)"
arch=('x86_64')
url="https://github.com/WohlSoft/Moondust-Project/"
license=('GPLv3')
depends=('desktop-file-utils' 'qt5-base' 'libjpeg-turbo' 'libpng' 'mesa' 'alsa-lib' 'dbus' 'mesa-utils' 'libxrandr' 'libxss' 'libxt' 'libxinerama' 'sndio' 'libxkbcommon' 'libxkbcommon-x11' 'libxcursor' 'libx11' 'libpulse' 'wayland' 'systemd-libs' 'libxv' 'libxxf86vm' 'sdl2' 'freetype2')
makedepends=('git')
optdepends=()
provides=('moondust-project')
install="moondust-project.install"
source=(
"https://wohlsoft.ru/projects/Moondust/_downloads/linux64/pge-project-stable-linux-ubuntu-16.04.tar.bz2"
"moondust.png::https://github.com/WohlSoft/Moondust-Project/raw/master/Editor/_resources/images/cat_builder/cat_builder_256.png"
"moondust-calibrator.png::https://github.com/WohlSoft/Moondust-Project/raw/master/PlayableCalibrator/_resources/icon/calibrator_256.png"
"moondust-musplay.png::https://github.com/WohlSoft/Moondust-Project/raw/master/MusicPlayer/_resources/cat_musplay/cat_musplay_256x256.png"
)
sha512sums=(
"7693291730d98785a9dee22c8770c458014d567a813f40cc4319f0643a62bab04718e93e7c55e477ecaf3ab20131232fa7362952909766fa2274271042838d48"
)

package() {
    mkdir -p "${pkgdir}/usr/share/games/thextech-aod"
    cp -r "${srcdir}/battle" "${pkgdir}/usr/share/games/thextech-aod/battle"
    cp -r "${srcdir}/graphics" "${pkgdir}/usr/share/games/thextech-aod/graphics"
    cp -r "${srcdir}/music" "${pkgdir}/usr/share/games/thextech-aod/music"
    cp -r "${srcdir}/sound" "${pkgdir}/usr/share/games/thextech-aod/sound"
    cp -r "${srcdir}/worlds" "${pkgdir}/usr/share/games/thextech-aod/worlds"
    chmod 0644 ${pkgdir}/usr/share/games/thextech-aod/sound/*
    chmod 0644 ${pkgdir}/usr/share/games/thextech-aod/music/*
    install -Dm0644 "${srcdir}/gameinfo.ini" "${pkgdir}/usr/share/games/thextech-aod/gameinfo.ini"
    install -Dm0644 "${srcdir}/music.ini" "${pkgdir}/usr/share/games/thextech-aod/music.ini"
    install -Dm0644 "${srcdir}/sounds.ini" "${pkgdir}/usr/share/games/thextech-aod/sounds.ini"
    install -Dm0644 "${srcdir}/thextech.ini" "${pkgdir}/usr/share/games/thextech-aod/thextech.ini"
    install -Dm0644 "${srcdir}/intro.lvlx" "${pkgdir}/usr/share/games/thextech-aod/intro.lvlx"
    install -Dm0644 "${srcdir}/outro.lvlx" "${pkgdir}/usr/share/games/thextech-aod/outro.lvlx"
    install -Dm0644 "${srcdir}/credits.txt" "${pkgdir}/usr/share/games/thextech-aod/credits.txt"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm0755 "${srcdir}/TheXTech/build/output/bin/thextech" "${pkgdir}/usr/bin/thextech-aod"
    install -Dm0644 "${srcdir}/TheXTech/resources/icon/thextech_128.png" "${pkgdir}/usr/share/pixmaps/thextech-aod.png"
    install -Dm0755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
