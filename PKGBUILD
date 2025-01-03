pkgname=muteled
_pkgname=MuteLED
pkgver=0.3
pkgrel=1
arch=('x86_64')
pkgdesc='A simple script aiming to fix the broken mute LED light on some HP laptop models'
url='https://github.com/username227/MuteLED'
license=('GPL-3.0-or-later')
depends=('acpid' 'pamixer' 'alsa-tools')
makedepends=('git')
source=("git+https://github.com/username227/${_pkgname}#tag=$pkgver")
sha256sums=('783ca11ae54cccf9226f2e399febed607a78469282e1b76d338852231fd7d493')
install=acpidinfo.install

package() {
install -Dm755 $srcdir/$_pkgname/muteled -t $pkgdir/usr/bin
install -Dm644 $srcdir/$_pkgname/mute-led -t $pkgdir/etc/acpi/events
install -Dm755 $srcdir/$_pkgname/muteled.sh -t $pkgdir/etc/acpi/actions
}
