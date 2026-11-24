# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
#
# This is the TEMPLATE for the AUR package. Do not bump pkgver/pkgrel or
# checksums here by hand: scripts/publish-aur.sh sets them when publishing.
# Edit this file only to change packaging (dependencies, install steps, ...).

pkgname=decaf
pkgver=2.3.0
pkgrel=1
pkgdesc="Suspend the system after a while: a scriptable sleep timer"
arch=('any')
url="https://github.com/Davi-S/decaf"
license=('MIT')
depends=('bash' 'systemd' 'glib2' 'libnotify' 'polkit')
install=decaf.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bff41b28bf2b4c9a531f9aec49689457ea44a9eabaa5b952c120ac73376da855')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
