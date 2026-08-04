# Maintainer: nicknb <nicknb at posteo dot com>
pkgname=swtchr
pkgver=0.1.4
pkgrel=1
arch=("x86_64")
pkgdesc="Gnome-style window switcher for the Sway window manager"
url="https://github.com/lostatc/swtchr"
license=("MIT")
depends=("gtk4" "gtk4-layer-shell" "sway")
makedepends=("rust" "pkg-config")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('aa6e0a0b3f2d79e577d0125e83f451ccb134b2e14198203610e6093ed9647aba0eaf7f5640f974fcc40e957c8fe91a025fcd4a953dd9fba45f706652a64ad455')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 target/release/swtchr "$pkgdir/usr/bin/swtchr"
    install -Dm 0755 target/release/swtchrd "$pkgdir/usr/bin/swtchrd"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
