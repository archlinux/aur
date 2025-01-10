pkgname=muteled
_pkgname=MuteLED
pkgver=0.3.1
pkgrel=1
arch=('x86_64')
pkgdesc='A simple script aiming to fix the broken mute LED light on some HP laptop models'
url='https://github.com/username227/MuteLED'
license=('GPL-3.0-or-later')
depends=('acpid' 'pamixer' 'alsa-tools')
makedepends=('git')
source=("git+https://github.com/username227/${_pkgname}#tag=$pkgver")
sha256sums=('0829c1aa3c1a3dc9bd96562571e0a3a2a3a9dc1bc754f67695f2756241d99dc6')
install=acpidinfo.install

package() {
install -Dm755 $srcdir/$_pkgname/muteled -t $pkgdir/usr/bin
install -Dm644 $srcdir/$_pkgname/mute-led -t $pkgdir/etc/acpi/events
install -Dm755 $srcdir/$_pkgname/muteled.sh -t $pkgdir/etc/acpi/actions
}
