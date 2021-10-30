# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=loraines-when-they-shine-bin
_pkgname=loraines-when-they-shine
pkgver=1.0
pkgrel=2
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('imagemagick')
depends=(
    'hicolor-icon-theme'
    'libglvnd'
    'libx11'
    'libxcb'
    'libxau'
    'libxdmcp'
)
pkgdesc='视觉小说《洛兰绽放之时》'
arch=('x86_64' 'i686')
url='https://github.com/MAY-game-studio/Loraines_when_they_shine'
license=('custom')
source=(
    "$pkgname-$pkgver-$pkgrel.zip::https://cloud.tsinghua.edu.cn/f/b834452fb9eb42008eab/?dl=1"
    "$_pkgname.desktop"
)
sha256sums=('33c00afa4d04a79fa3ddf6ebff7ee98c4f2d7dd533301d16787cbee34035d4b0'
            '9a98ccd8cf024bfd3d22579d7e9a122180cefe81899417004a198d7ce6c2bdb3')

package() {
    install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
    cd 'LorainesWhenTheyShine-1.0-pc'
    install -Dd "$pkgdir/opt/${_pkgname}/lib"
    cp -r game renpy *.sh *.py *.txt "$pkgdir/opt/${_pkgname}"
    cp -r lib/linux* lib/python* "$pkgdir/opt/${_pkgname}/lib"
    convert game/gui/window_icon.png -resize 512x512 icon-512x512.png
    install -Dm644 icon-512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
