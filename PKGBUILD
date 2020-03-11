# Maintainer: benwaffle <vala@iofel.me>
# Maintainer: Prince781 <princetonferro@gmail.com>
pkgname=vala-language-server
pkgver=0.0.1
pkgrel=1
pkgdesc='Language Server for Vala'
arch=('x86_64')
url="https://github.com/benwaffle/vala-language-server"
license=('LGPL-2.1')
depends=('libgee' 'jsonrpc-glib' 'vala' 'meson')
source=("https://github.com/benwaffle/vala-language-server/archive/$pkgver.tar.gz")
sha256sums=('da82293234a36293f320a13feb59ab968ca1aabdbb9797c112114eaf836249e1')
 
#prepare() {
#	cd "$pkgname"
#}
 
build() {
    cd "$pkgname-$pkgver"
    arch-meson build
    ninja -C build
}
 
package() {
    cd "$pkgname-$pkgver"
    DESTDIR="${pkgdir}" ninja -C build install
}

