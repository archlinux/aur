pkgname=muteled
_pkgname=MuteLED
pkgver=1.2.1
pkgrel=1
arch=('x86_64')
pkgdesc='A simple script aiming to fix the broken mute LED light on some HP laptop models'
url='https://github.com/username227/MuteLED'
license=(GPL-3.0-or-later)
depends=('acpid' 'pamixer' 'alsa-tools')
source=("muteled-$pkgver.tar.gz::https://github.com/username227/MuteLED/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('94eeb174f529dca10da49b25e40bd1d74a1f15ea5b8ad44f44fd4d0407453e63')
install=acpidinfo.install

package() {
install -Dm755 $srcdir/$_pkgname-$pkgver/muteled -t $pkgdir/usr/bin
install -Dm644 $srcdir/$_pkgname-$pkgver/mute-led -t $pkgdir/etc/acpi/events
install -Dm755 $srcdir/$_pkgname-$pkgver/muteled.sh -t $pkgdir/etc/acpi/actions
}
