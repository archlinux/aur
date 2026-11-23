# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
#
# This is the TEMPLATE for the AUR package. Do not bump pkgver/pkgrel or
# checksums here by hand: scripts/publish-aur.sh sets them when publishing.
# Edit this file only to change packaging (dependencies, install steps, ...).

pkgname=expresso
pkgver=2.2.1
pkgrel=1
pkgdesc="Keep the system awake for a while: a scriptable systemd-inhibit lock"
arch=('any')
url="https://github.com/Davi-S/expresso"
license=('MIT')
depends=('bash' 'systemd' 'glib2' 'libnotify')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('012a7351451b6b3b17df4dea5d3bbf58a9ba1b0ab1e4007a54c8ec20c94433a0')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
