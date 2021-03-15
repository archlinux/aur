pkgname=mt
pkgver=0.1.0+alpha2021.03.15
pkgrel=1
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Mt")
makedepends=('cargo')
depends=('gtk3' 'vte3' 'libhandy')
arch=('x86_64')
url="https://gitlab.com/Miridyan/mt"
source=("$pkgname-v$pkgver-$pkgrel.tar.gz::https://gitlab.com/Miridyan/$pkgname/-/archive/v$pkgver-$pkgrel/$pkgname-v$pkgver-$pkgrel.tar.gz")
license=('GPL2')
sha512sums=('17b970d4783ffa0b7050bcf55c5f1b0913bc0646fd0e2bfebc69fb0710dc3d7adfc922813c1948e1d2bc705b9c402e548f072decea22c623666d8d72b52e1ef6')

build() {
    cd $srcdir/$pkgname-v$pkgver-$pkgrel
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

    install -Dm 644 "data/profile/Default.ron" "$pkgdir/usr/share/Mt/profiles/Default.ron"
}
