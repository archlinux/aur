pkgname=muteled
_pkgname=MuteLED
pkgver=1.1.1
pkgrel=1
arch=('x86_64')
pkgdesc='A simple script aiming to fix the broken mute LED light on some HP laptop models'
url='https://github.com/username227/MuteLED'
license=('GPL-3.0-or-later')
depends=('acpid' 'pamixer' 'alsa-tools')
source=("muteled-$pkgver.tar.gz::https://github.com/username227/MuteLED/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8eef31bcea9bad5522cb92f5f1269ce3a9d5ec6c42598a014b265d0b6764cf6a')
install=acpidinfo.install

package() {
install -Dm755 $srcdir/$_pkgname-$pkgver/muteled -t $pkgdir/usr/bin
install -Dm644 $srcdir/$_pkgname-$pkgver/mute-led -t $pkgdir/etc/acpi/events
install -Dm755 $srcdir/$_pkgname-$pkgver/muteled.sh -t $pkgdir/etc/acpi/actions
}
