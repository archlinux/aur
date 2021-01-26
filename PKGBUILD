pkgname=mt
pkgver=0.1.0+alpha2021.01.25
pkgrel=4
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Mt")
makedepends=('cargo')
depends=('gtk3' 'vte3' 'libhandy')
arch=('x86_64')
url="https://gitlab.com/Miridyan/terminal"
source=("terminal-v$pkgver-$pkgrel.tar.gz::https://gitlab.com/Miridyan/terminal/-/archive/v$pkgver-$pkgrel/terminal-v$pkgver-$pkgrel.tar.gz")
license=('BSD')
sha512sums=('30351892a32b7ba748e89fafac71b7e03a3c7b1d1157123987556922de162d76d37f40ca1476661b71c330531aa514712db14f87ba06fba72e1d9c56ee34b85c')

build() {
    cd $srcdir/terminal-v$pkgver-$pkgrel
    cargo build --release
}

package() {
    cd $srcdir/terminal-v$pkgver-$pkgrel

    install -Dm 755 "target/release/terminal" "$pkgdir/usr/bin/mt"
    install -Dm 644 "data/com.gitlab.miridyan.Mt.desktop" "$pkgdir/usr/share/applications/com.gitlab.miridyan.Mt.desktop"
    install -Dm 644 "data/icons/com.gitlab.miridyan.Mt.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.gitlab.miridyan.Mt.svg"
    install -Dm 644 "data/profile/default.tpfl.yml" "$pkgdir/usr/share/mt/profiles/default.tpfl.yml"
    install -Dm 644 "data/colorscheme/base16.tscm.yml" "$pkgdir/usr/share/mt/colorschemes/base16.tscm.yml"
}
