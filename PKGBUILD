# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>

pkgname=crum-bs-bin
_pkgname=crumbs
pkgver=0.2.0
pkgrel=1
pkgdesc="Find and remove app leftovers, caches and system bloat (static binary)"
arch=('x86_64')
url="https://github.com/asafelobotomy/crumbs"
license=('GPL-3.0-or-later')
# Installs /usr/bin/crumbs, as does the unrelated AUR package `crumbs`.
provides=("crum-bs=$pkgver")
conflicts=('crum-bs' 'crumbs')
# The release binary is already stripped, and static.
options=('!strip' '!debug')
source=("$_pkgname-$pkgver-LICENSE::$url/releases/download/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-$pkgver-$CARCH-linux-musl")
sha256sums=('fb981668c18a279e285fc4d83fba1e836cc84dd4daa73c9697d3cfd2d8aca6e0')
sha256sums_x86_64=('05ebf5f773c172a939b1ee938d25f7931bb0d3b75121bdd49e203592637aec49')

package() {
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
