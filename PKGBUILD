# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
#
# This is the TEMPLATE for the AUR package. Do not bump pkgver/pkgrel or
# checksums here by hand: scripts/publish-aur.sh sets them when publishing.
# Edit this file only to change packaging (dependencies, install steps, ...).

pkgname=decaf
pkgver=2.1.0
pkgrel=1
pkgdesc="Suspend the system after a while: a scriptable sleep timer"
arch=('any')
url="https://github.com/Davi-S/decaf"
license=('MIT')
depends=('bash' 'systemd' 'glib2' 'libnotify')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83614998b96e8aace490c5ea0c10c965831192aa859474b01268904855fb2dab')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
