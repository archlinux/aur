# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=intermodal-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="User-friendly and featureful CLI BitTorrent metainfo utility, written in Rust"
arch=('x86_64')
url="https://github.com/casey/intermodal"
license=('custom:CC0')
provides=('intermodal')
conflicts=('intermodal')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/imdl-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('f0a9410518d1170553551e5f59ebcb9579900b63b0194298cb980688e80408a4')

package() {
    install -Dm 755 "imdl" "$pkgdir/usr/bin/imdl"

    # shell completions
    install -Dm644 "completions/_imdl" "$pkgdir/usr/share/zsh/site-functions/_imdl"
    install -Dm644 "completions/imdl.bash" "$pkgdir/usr/share/bash-completion/completions/imdl"
    install -Dm644 "completions/imdl.fish" "$pkgdir/usr/share/fish/vendor_completions.d/imdl.fish"

    # man pages
    install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"

    # license
    install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
