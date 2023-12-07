# Maintainer: icepie <icepie.dev [at] gmail dot com>
pkgname=kylin-virtual-keyboard-git
_pkgname=kylin-virtual-keyboard
pkgver=1.1.1
pkgrel=2
pkgdesc="麒麟虚拟键盘输入法UI工程，该工程适配fcitx5最新的虚拟键盘支持机制。"
arch=("x86_64")
url="https://gitee.com/openkylin/kylin-virtual-keyboard"
license=("custom")
depends=()
optdepends=()
provides=('kylin-virtual-keyboard')
conflicts=('kylin-virtual-keyboard-bin')
replaces=()
source=('git+https://gitee.com/openkylin/kylin-virtual-keyboard.git')

sha512sums=('SKIP')

depends=(
    'qt5-base'
    'fcitx5'
    'fcitx5-qt'
    'gsettings-qt'
    # 'qt5-declarative'
    # 'qt5-x11extras'
    'kwindowsystem5'
    'qt5-quickcontrols2'
    'qt5-graphicaleffects'
    'qt5-svg'
)

package() {
    cd ${srcdir}/${_pkgname}

    qmake .
    make install INSTALL_ROOT=${pkgdir}
}

# glib-compile-schemas /usr/share/glib-2.0/schemas


