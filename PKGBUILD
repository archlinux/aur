# Maintainer: emersion <contact emersion fr>

pkgname=swayvkshot
pkgver=0.0.1
pkgrel=1
license=('MIT')
pkgdesc=' Sway screenshots for vulkan '
url='https://github.com/xiliuya/swayvkshot.git'
arch=('x86_64')
depends=(
    'libglvnd'
    'libinput'
    'libxcb'
    'opengl-driver'
    'wayland'
    'xcb-util-errors'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'wlroots' 
    'libdrm'
)
makedepends=(
    'glslang'
    'meson'
    'ninja'
    'systemd'
    'vulkan-headers'
    'wayland-protocols'
    'xorg-xwayland'
)
source=("${pkgname%-*}::git+https://github.com/xiliuya/swayvkshot.git")
sha1sums=('SKIP')
provides=('swayvkshot')
conflicts=('swayvkshot')
build() {
    cd "${srcdir}"
    arch-meson "$pkgname" build
    ninja -C build
}


package() {
    install -Dm755 "$srcdir/build/swayvkshot" -t "$pkgdir/usr/bin/"
}
