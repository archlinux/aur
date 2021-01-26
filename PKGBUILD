pkgname=mt
pkgver=0.1.0+alpha2021.01.25
pkgrel=2
pkgdesc="A terminal written in GTK+ and Rust"
provides=("com.gitlab.miridyan.Mt")
makedepends=('cargo')
depends=('gtk3' 'vte3' 'libhandy')
arch=('x86_64')
url="https://gitlab.com/Miridyan/terminal"
source=("terminal-v$pkgver.tar.gz::https://gitlab.com/Miridyan/terminal/-/archive/v$pkgver/terminal-v$pkgver.tar.gz")
license=('BSD')
sha512sums=('e97876c115b828c49eef6bec7692d7e181599e01a981976fd1bcb868d1b9b4a21fe16df514eace5d255809453cc66f60b009eafe0bed7d74619f588de8b7695e')

build() {
    cd $srcdir/terminal-v$pkgver
    cargo build --release
}

package() {
    cd $srcdir/terminal-v$pkgver

    install -Dm 755 "target/release/terminal" "$pkgdir/usr/bin/mt"
    install -Dm 644 "data/com.gitlab.miridyan.Mt.desktop" "$pkgdir/usr/share/applications/com.gitlab.miridyan.Mt.desktop"
    install -Dm 644 "data/icons/com.gitlab.miridyan.Mt.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.gitlab.miridyan.Mt.svg"
    install -Dm 644 "data/profile/default.tpfl.yml" "$pkgdir/usr/share/mt/profiles/default.tpfl.yml"
    install -Dm 644 "data/colorscheme/base16.tscm.yml" "$pkgdir/usr/share/mt/colorschemes/base16.tscm.yml"
}
