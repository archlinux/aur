pkgname=mt
pkgver=0.1.0+alpha2021.02.08
pkgrel=1
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Mt")
makedepends=('cargo')
depends=('gtk3' 'vte3' 'libhandy')
arch=('x86_64')
url="https://gitlab.com/Miridyan/mt"
source=("$pkgname-v$pkgver-$pkgrel.tar.gz::https://gitlab.com/Miridyan/$pkgname/-/archive/v$pkgver-$pkgrel/$pkgname-v$pkgver-$pkgrel.tar.gz")
license=('GPL2')
sha512sums=('388fcc5ee1adfd99f857c9d50a8a1bbc38c69859f6a3b49c95ea3504aa34e8411da0742ee5e70bfb70a6515a07b53793cfd79cc9defebfa1b189d506df1f6ee8')

build() {
    cd $srcdir/$pkgname-v$pkgver-$pkgrel
    cargo build --release
}

package() {
    cd $srcdir/$pkgname-v$pkgver-$pkgrel

    install -Dm 755 "target/release/mt" "$pkgdir/usr/bin/Mt"
    install -Dm 644 "data/com.gitlab.miridyan.Mt.desktop" "$pkgdir/usr/share/applications/com.gitlab.miridyan.Mt.desktop"
    install -Dm 644 "data/icons/com.gitlab.miridyan.Mt.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.gitlab.miridyan.Mt.svg"
    install -Dm 644 "data/profile/Default.ron" "$pkgdir/usr/share/mt/profiles/Default.ron"
}
