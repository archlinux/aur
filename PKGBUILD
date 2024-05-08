# maintainer: zxkmm (IHp4a21tQGhvdG1haWwuY29t)
# auto running on siyuan official repo
# PKGBUILD is copied from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=siyuan-appimage
# which is made by vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=siyuan_stable
pkgver=v3.0.13
pkgrel=0
pkgdesc="auto upload to AUR when SiYuan stable release"
arch=("x86_64")
url="https://b3log.org/siyuan"
license=("AGPL-3.0-only")
_pkgname=siyuan-v3.0.13-linux.AppImage
noextract=(siyuan-v3.0.13-linux.AppImage)
options=("!strip" "!debug")
depends=("fuse2")
optdepends=('pandoc: docx export')
source=("::https://github.com/siyuan-note/siyuan/releases/download/v3.0.13/siyuan-v3.0.13-linux.AppImage")

_installdir=/opt/appimages

prepare() {
    chmod a+x 
    ./ --appimage-extract >/dev/null
    sed -i "s+AppRun+/siyuan.AppImage+" "squashfs-root/siyuan.desktop"
    sed -i "s+^Icon=.*+Icon=siyuan-appimage+" "squashfs-root/siyuan.desktop"
}

package() {
    install -Dm755  "//siyuan.AppImage"
    install -Dm644 "squashfs-root/resources/stage/icon.png" "/usr/share/icons/hicolor/512x512/apps/siyuan-appimage.png"
    install -Dm644 "squashfs-root/siyuan.desktop" "/usr/share/applications/siyuan-appimage.desktop"
}
