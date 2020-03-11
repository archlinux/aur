# Maintainer: benwaffle <vala@iofel.me>
# Maintainer: Prince781 <princetonferro@gmail.com>
pkgname=vala-language-server
pkgver=0.0.2
pkgrel=1
pkgdesc='Language Server for Vala'
arch=('x86_64')
url="https://github.com/benwaffle/vala-language-server"
license=('LGPL-2.1')
depends=('libgee' 'jsonrpc-glib' 'vala' 'meson')
source=("https://github.com/benwaffle/vala-language-server/archive/$pkgver.tar.gz")
sha256sums=('e0a867f3940eea326ea230ee2dd2d98bf5922a7d6310d0d134063db56513907e')
 
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

