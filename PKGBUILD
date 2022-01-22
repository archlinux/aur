# Maintainer: Ayatale <ayatale@qq.com>

pkgname=fcitx5-cn
pkgver=5.0.13
pkgrel=1
pkgdesc='Meta package to install fcitx5 and Chinese addons'
url='https://github.com/fcitx/fcitx5'
arch=('x86_64')
license=('GPL')
depends=('fcitx5' 'fcitx5-configtool' 'fcitx5-gtk' fcitx5-qt 'fcitx5-chinese-addons' 'fcitx5-pinyin-moegirl' 'fcitx5-pinyin-zhwiki')
optdepends=('fcitx5-qt4' 'fcitx5-material-color' 'fcitx5-nord')

prepare() {
  echo "GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=\@im=fcitx
INPUT_METHOD=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus" >fcitx5.conf
}

package() {
  install -Dm644 fcitx5.conf "$pkgdir/etc/environment.d/fcitx5.conf"
}
