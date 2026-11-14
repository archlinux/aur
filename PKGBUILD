# Maintainer: Coobyk
# This file is rendered by .github/workflows/release.yml — pkgver and
# sha256sums are substituted there before the package is pushed to the AUR.
pkgname=rsusage-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Blazing fast usage reports for coding agents - a Rust rewrite of ccusage (binary release)"
arch=('x86_64')
url="https://github.com/Coobyk/rsusage"
license=('MIT')
depends=('gcc-libs')
provides=('rsusage')
conflicts=('rsusage')
# versioned local filename — a bare `rsusage-linux-x86_64.tar.gz` collides
# with helpers' source caches across releases (stale file → sum mismatch)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/rsusage-linux-x86_64.tar.gz")
sha256sums=('3118ac34c799e01901719cefa0854642507a8222e120703fb1f4aab08fe78024')

package() {
    install -Dm755 rsusage "$pkgdir/usr/bin/rsusage"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
