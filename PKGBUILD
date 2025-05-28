pkgname=muteled
_pkgname=MuteLED
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
pkgdesc='A simple script aiming to fix the broken mute LED light on some HP laptop models'
url='https://github.com/username227/MuteLED'
license=('GPL-3.0-or-later')
depends=('acpid' 'pamixer' 'alsa-tools')
source=("muteled::https://github.com/username227/MuteLED/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('139b4864dd6bea329665e16fff5d16a0551976fbef6334e86a4aa80bea68d846')
install=acpidinfo.install

package() {
install -Dm755 $srcdir/$_pkgname-$pkgver/muteled -t $pkgdir/usr/bin
install -Dm644 $srcdir/$_pkgname-$pkgver/mute-led -t $pkgdir/etc/acpi/events
install -Dm755 $srcdir/$_pkgname-$pkgver/muteled.sh -t $pkgdir/etc/acpi/actions
}
