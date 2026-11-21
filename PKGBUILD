# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
#
# This is the TEMPLATE for the AUR package. Do not bump pkgver/pkgrel or
# checksums here by hand: scripts/publish-aur.sh sets them when publishing.
# Edit this file only to change packaging (dependencies, install steps, ...).

pkgname=decaf
pkgver=2.2.0
pkgrel=1
pkgdesc="Suspend the system after a while: a scriptable sleep timer"
arch=('any')
url="https://github.com/Davi-S/decaf"
license=('MIT')
depends=('bash' 'systemd' 'glib2' 'libnotify')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ab083d6c950e43d7af266002c2fc9cc733a74750319e0a2283507d50eeba7b2')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
