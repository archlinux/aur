# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="yuzu-appimage"

_commit="537296095"
pkgver="20240304"

pkgrel=2
epoch=1
pkgdesc="An experimental open-source Nintendo Switch emulator/debugger, GUI version, already compiled"
url="https://github.com/LightningMods/def-not-yuzu/"
license=("GPL2")
arch=("x86_64")
provides=("yuzu")
conflicts=("yuzu-early-access-appimage")
replaces=("yuzu-early-access-appimage")
depends=("fuse2" "zlib" "libva" "hicolor-icon-theme")
optdepends=("qt5-multimedia: for QT5 support"
            "qt5-wayland: for QT5 Wayland support"
            "qt6-multimedia: for QT6 support"
            "qt6-wayland: for QT6 Wayland support"
            "vulkan-intel: for Vulkan support on Intel"
            "vulkan-radeon: for Vulkan support on AMD"
            "nvidia-utils: for Vulkan support on NVIDIA"
            "vulkan-mesa-layers: additional vulkan layers")
#source=("https://gitlab.archlinux.org/alphajack/citra-yuzu/-/raw/main/yuzu-mainline-$pkgver-$_commit.AppImage?ref_type=heads&inline=false"
source=("https://github.com/LightningMods/def-not-yuzu/releases/download/x.xx/yuzu-mainline-$pkgver-$_commit.AppImage"
        "yuzu.desktop"
        "yuzu.svg")
b2sums=('b52ae63cc9f626488800ddc072e9395289128072eea0dabd8e3448e6df835984ff3bbca22307324b333b974c6ddd50a63c9826bf710158f37842e969616a380c'
        '10295ea67c09025c2f44af79d61d87e68e2fda212f15cb94f26ee6cad2f7f8da64c3fa1cc05ffc57d8bc112faa92f2d3ac9d5589aeedadcd5a07018adcce93ab'
        'b00bd830da5ff59557a2c98e530ef4fb520d68b45556e8d5859e6f05a7dae758902b1fb2a6d956aaebbc602890ba9131e84f455cf4a817d2ef3d55c542ecfb82')
options=("!strip")

package(){
 install -D -m 755 "yuzu-mainline-$pkgver-$_commit.AppImage"       "$pkgdir/usr/bin/yuzu"
 install -D -m 644 "yuzu.desktop"                               -t "$pkgdir/usr/share/applications"
 install -D -m 644 "yuzu.svg"                                   -t "$pkgdir/usr/share/pixmaps"

}

