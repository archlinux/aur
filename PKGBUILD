# Maintainer: benwaffle <vala@iofel.me>
# Maintainer: Prince781 <princetonferro@gmail.com>
pkgname=vala-language-server
_pkgver=0.48.5
pkgver=${_pkgver/-/+}
pkgrel=1
pkgdesc='Language Server for Vala'
arch=('x86_64')
url="https://github.com/vala-lang/vala-language-server"
license=('LGPL-2.1')
depends=('libgee' 'jsonrpc-glib' 'vala' 'meson')
makedepends=('scdoc')
source=("https://github.com/vala-lang/vala-language-server/releases/download/$_pkgver/vala-language-server-$_pkgver.tar.xz")
sha256sums=('698a0f26b61a882517f31039e7dc8efdda1384de0687b1ab78f2a768c305b17e')
 
prepare() {
    cd "$pkgname-$_pkgver"
}
 
build() {
    cd "$pkgname-$_pkgver"
    arch-meson build
    ninja -C build
}
 
package() {
    cd "$pkgname-$_pkgver"
    DESTDIR="${pkgdir}" ninja -C build install
}

