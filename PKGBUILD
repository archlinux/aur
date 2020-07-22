# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantwallpaper
pkgname=$_pkgname
pkgver=202006121511
pkgrel=1
pkgdesc="wallpaper generator for instantOS"
url="https://github.com/instantOS/instantwallpaper"
arch=('any')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft' 'feh' 'imagemagick' 'nitrogen')
makedepends=('git')
provides=(instantwallpaper)
conflicts=(instantwallpaper)
source=("$_pkgname::git+https://github.com/instantOS/instantWALLPAPER.git")

sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    cd $_pkgname
    echo "no prepare"
}

build() {
    cd $_pkgname
    echo "no build"
}

package() {
    RAW="https://raw.githubusercontent.com/instantOS/instantLOGO/master"
    MEDIARAW="https://media.githubusercontent.com/media/instantOS/instantLOGO/master"
    cd $_pkgname
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/backgrounds
    mkdir -p ${pkgdir}/usr/share/instantwallpaper

    mv wallutils.sh ${pkgdir}/usr/share/instantwallpaper
    wget -qO ${pkgdir}/usr/share/backgrounds/instant.png "$MEDIARAW/wallpaper/defaultwall.png"
    wget -qO ${pkgdir}/usr/share/backgrounds/readme.jpg "$MEDIARAW/wallpaper/readme.jpg"
    # ascii art for neofetch
    wget -qO ${pkgdir}/usr/share/instantwallpaper/ascii.txt "$RAW/ascii.txt"
    wget -qO ${pkgdir}/usr/share/instantwallpaper/defaultphoto.png "$MEDIARAW/wallpaper/defaultphoto.png"
    chmod +x *.sh
    mv wall.sh ${pkgdir}/usr/bin/instantwallpaper
}
