# Maintainer: icepie <icepie.dev [at] gmail dot com>
pkgname=kylin-virtual-keyboard-git
_pkgname=kylin-virtual-keyboard
pkgver=3.0.0.0.r0.gcad3675
pkgrel=1
pkgdesc="麒麟虚拟键盘输入法UI工程，该工程适配fcitx5最新的虚拟键盘支持机制。"
arch=("x86_64")
url="https://gitee.com/openkylin/kylin-virtual-keyboard"
license=("GPL-3.0-or-later")
optdepends=()
provides=('kylin-virtual-keyboard')
conflicts=('kylin-virtual-keyboard-bin')
replaces=()
source=('git+https://gitee.com/openkylin/kylin-virtual-keyboard.git')
makedepends=('git')
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

build() {
    cd ${srcdir}/${_pkgname}
    qmake .
}

package() {
    cd ${srcdir}/${_pkgname}
    make install INSTALL_ROOT=${pkgdir}
}

pkgver() {
    cd ${srcdir}/${_pkgname}
    git describe --long --tags --abbrev=7 | cut -d '/' -f 2 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# glib-compile-schemas /usr/share/glib-2.0/schemas


