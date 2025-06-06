pkgname=muteled
_pkgname=MuteLED
pkgver=1.1.0
pkgrel=1
arch=('x86_64')
pkgdesc='A simple script aiming to fix the broken mute LED light on some HP laptop models'
url='https://github.com/username227/MuteLED'
license=('GPL-3.0-or-later')
depends=('acpid' 'pamixer' 'alsa-tools')
source=("muteled-$pkgver::https://github.com/username227/MuteLED/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('68f35515ff67e9d307bb8fe6e69cab312289ce889fbb1889b69502322c254882')
install=acpidinfo.install

package() {
install -Dm755 $srcdir/$_pkgname-$pkgver/muteled -t $pkgdir/usr/bin
install -Dm644 $srcdir/$_pkgname-$pkgver/mute-led -t $pkgdir/etc/acpi/events
install -Dm755 $srcdir/$_pkgname-$pkgver/muteled.sh -t $pkgdir/etc/acpi/actions
}
