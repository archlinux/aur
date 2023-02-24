# Maintainer: benwaffle <vala@iofel.me>
# Maintainer: Prince781 <princetonferro@gmail.com>
pkgname=vala-language-server
_pkgver=0.48.6
pkgver=${_pkgver/-/+}
pkgrel=1
pkgdesc='Language Server for Vala'
arch=('x86_64')
url="https://github.com/vala-lang/vala-language-server"
license=('LGPL-2.1')
depends=('libgee' 'jsonrpc-glib' 'vala' 'meson')
makedepends=('scdoc')
source=("https://github.com/vala-lang/vala-language-server/releases/download/$_pkgver/vala-language-server-$_pkgver.tar.xz")
sha256sums=('8339429801bedb3436cb5c64721f22f9529f2af02c16ba5937d0b0c9ceaabf27')
 
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

