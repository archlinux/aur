# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=hypr-git
pkgver=0.0
pkgrel=1
pkgdesc="Hypr is a Linux tiling window manager for Xorg. It's written in XCB with modern C++ and aims to provide easily readable and expandable code."
arch=('x86_64')
url="https://github.com/vaxerski/Hypr"
license=('BSD')
depends=('cairo' 'gdb' 'ninja' 'gcc' 'cmake' 'libxcb' 'xcb-proto' 'xcb-util' 'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm' 'gtkmm' 'gtk4' 'gtkmm3')
source=("$pkgname::git+https://github.com/vaxerski/Hypr")
sha256sums=('SKIP')

build() {
    cd $srcdir/$pkgname

    make clear
    make release
}

package() {
    cd $srcdir/$pkgname

    mkdir -p "${pkgdir}/usr/bin/"
    install -D "build/Hypr" "${pkgdir}/usr/bin"

    mkdir -p "${pkgdir}/usr/share/xsessions"
    install -D "example/hypr.desktop" "${pkgdir}/usr/share/xsessions" 
}

