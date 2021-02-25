pkgname=mt
pkgver=0.1.0+alpha2021.02.24
pkgrel=1
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Mt")
makedepends=('cargo')
depends=('gtk3' 'vte3' 'libhandy')
arch=('x86_64')
url="https://gitlab.com/Miridyan/mt"
source=("$pkgname-v$pkgver-$pkgrel.tar.gz::https://gitlab.com/Miridyan/$pkgname/-/archive/v$pkgver-$pkgrel/$pkgname-v$pkgver-$pkgrel.tar.gz")
license=('GPL2')
sha512sums=('dea18c50ca7114d103390f9a30ba7eb651f86c6d7a90cc9b617e866487de6a8d461d907423a39e5482793510a768a1b5dd40b05ce2daf7f9c6340b8d9c1e96b1')

build() {
    cd $srcdir/$pkgname-v$pkgver-$pkgrel
    cargo build --release
}

package() {
    cd $srcdir/$pkgname-v$pkgver-$pkgrel

    install -Dm 755 "target/release/mt" "$pkgdir/usr/bin/Mt"
    install -Dm 644 "data/com.gitlab.miridyan.Mt.desktop" "$pkgdir/usr/share/applications/com.gitlab.miridyan.Mt.desktop"
    install -Dm 644 "data/icons/com.gitlab.miridyan.Mt.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.gitlab.miridyan.Mt.svg"
    install -Dm 644 "data/profile/Default.ron" "$pkgdir/usr/share/Mt/profiles/Default.ron"
}
