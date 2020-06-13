# Maintainer: benwaffle <vala@iofel.me>
# Maintainer: Prince781 <princetonferro@gmail.com>
pkgname=vala-language-server
_pkgver=0.48
pkgver=${_pkgver/-/+}
pkgrel=1
pkgdesc='Language Server for Vala'
arch=('x86_64')
url="https://github.com/benwaffle/vala-language-server"
license=('LGPL-2.1')
depends=('libgee' 'jsonrpc-glib' 'vala' 'meson')
source=("https://github.com/benwaffle/vala-language-server/archive/$_pkgver.tar.gz")
sha256sums=('88d23c9e34a5db7dd62675f0decf3447c47f7034f5a1729d6a4c901406ff1e06')
 
#prepare() {
#	cd "$pkgname"
#}
 
build() {
    cd "$pkgname-$_pkgver"
    arch-meson build
    ninja -C build
}
 
package() {
    cd "$pkgname-$_pkgver"
    DESTDIR="${pkgdir}" ninja -C build install
}

