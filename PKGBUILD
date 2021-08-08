pkgname=mt
pkgver=0.1.0+alpha2021.07.11
pkgrel=2
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Mt")
makedepends=('cargo')
depends=('gtk3' 'vte3' 'libhandy')
arch=('x86_64')
url="https://gitlab.com/Miridyan/mt"
source=("$pkgname-v$pkgver-$pkgrel.tar.gz::https://gitlab.com/Miridyan/$pkgname/-/archive/v$pkgver-$pkgrel/$pkgname-v$pkgver-$pkgrel.tar.gz")
license=('GPL2')
sha512sums=('4e5b31d2e5c6dc2090664fd0fa2be259840e28f5c7fc9c1dbff58bedaccacdf277ca8eb338bfd9ff24dae8210ab97b07608feadc17d4676216b08fd990f98287')

build() {
    cd $srcdir/$pkgname-v$pkgver-$pkgrel
    unset CARGO_TARGET_DIR
    cargo build --release
}

package() {
    cd $srcdir/$pkgname-v$pkgver-$pkgrel

    install -Dm 755 "target/release/mt" "$pkgdir/usr/bin/Mt"
    install -Dm 644 "data/com.gitlab.miridyan.Mt.desktop" "$pkgdir/usr/share/applications/com.gitlab.miridyan.Mt.desktop"
    install -Dm 644 "data/icons/16x16/apps/com.gitlab.miridyan.Mt.svg" "$pkgdir/usr/share/icons/hicolor/16x16/apps/com.gitlab.miridyan.Mt.svg"
    install -Dm 644 "data/icons/22x22/apps/com.gitlab.miridyan.Mt.svg" "$pkgdir/usr/share/icons/hicolor/22x22/apps/com.gitlab.miridyan.Mt.svg"
    install -Dm 644 "data/icons/24x24/apps/com.gitlab.miridyan.Mt.svg" "$pkgdir/usr/share/icons/hicolor/24x24/apps/com.gitlab.miridyan.Mt.svg"
    install -Dm 644 "data/icons/32x32/apps/com.gitlab.miridyan.Mt.svg" "$pkgdir/usr/share/icons/hicolor/32x32/apps/com.gitlab.miridyan.Mt.svg"
    install -Dm 644 "data/icons/48x48/apps/com.gitlab.miridyan.Mt.svg" "$pkgdir/usr/share/icons/hicolor/48x48/apps/com.gitlab.miridyan.Mt.svg"
    install -Dm 644 "data/icons/64x64/apps/com.gitlab.miridyan.Mt.svg" "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.gitlab.miridyan.Mt.svg"
    install -Dm 644 "data/icons/scalable/apps/com.gitlab.miridyan.Mt.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.gitlab.miridyan.Mt.svg"
    install -Dm 644 "data/icons/symbolic/apps/com.gitlab.miridyan.Mt-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.gitlab.miridyan.Mt-symbolic.svg"
}
