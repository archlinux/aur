pkgname=muteled
_pkgname=MuteLED
pkgver=1.2.2
pkgrel=1
arch=('x86_64')
pkgdesc='A simple script aiming to fix the broken mute LED light on some HP laptop models'
url='https://github.com/username227/MuteLED'
license=(GPL-3.0-or-later)
depends=('acpid' 'pamixer' 'alsa-tools')
source=("muteled-$pkgver.tar.gz::https://github.com/username227/MuteLED/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aea509554e21e5688462bb1ad24c810626b882d9bf7307b4097b6bc9a1346a2e')
install=acpidinfo.install

package() {
install -Dm755 $srcdir/$_pkgname-$pkgver/muteled -t $pkgdir/usr/bin
install -Dm644 $srcdir/$_pkgname-$pkgver/mute-led -t $pkgdir/etc/acpi/events
install -Dm755 $srcdir/$_pkgname-$pkgver/muteled.sh -t $pkgdir/etc/acpi/actions
}
