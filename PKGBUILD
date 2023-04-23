# Maintainer: Ayatale <ayatale@qq.com>

pkgname=fcitx5-cn-meta
pkgver=5.0.23
pkgrel=2
pkgdesc='Meta package to install fcitx5 and Chinese addons'
url='https://github.com/fcitx/fcitx5'
arch=('x86_64')
license=('GPL')
depends=('fcitx5' 'fcitx5-configtool' 'fcitx5-gtk' 'fcitx5-qt' 'fcitx5-chinese-addons' 'fcitx5-pinyin-zhwiki')
optdepends=('fcitx5-qt4' 'fcitx5-material-color' 'fcitx5-nord' 'fcitx5-pinyin-moegirl' 'fcitx5-pinyin-custom-pinyin-dictionary')

prepare() {
  echo 'export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus' >fcitx5.sh
}

package() {
  install -Dm644 fcitx5.sh "$pkgdir/etc/profile.d/fcitx5.sh"
}
