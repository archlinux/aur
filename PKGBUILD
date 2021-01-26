pkgname=mt
pkgver=0.1.0+alpha2021.01.25
pkgrel=3
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Mt")
makedepends=('cargo')
depends=('gtk3' 'vte3' 'libhandy')
arch=('x86_64')
url="https://gitlab.com/Miridyan/terminal"
source=("terminal-v$pkgver-$pkgrel.tar.gz::https://gitlab.com/Miridyan/terminal/-/archive/v$pkgver-$pkgrel/terminal-v$pkgver-$pkgrel.tar.gz")
license=('BSD')
sha512sums=('8c8ce24b80f1793cea98b4fd084d2084531d3beae7298c69313f54e03c97ef9073fbd834e781829f34e6d14fa77c718e753eeb4e91ff991f05e9baa0ccfa4458')

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
