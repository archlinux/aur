pkgname=muteled
_pkgname=MuteLED
pkgver=0.1
pkgrel=2
arch=('x86_64')
pkgdesc='A simple script aiming to fix the broken mute LED light on some HP laptop models'
url='https://github.com/username227/MuteLED'
license=('GPL-3.0-or-later')
depends=('acpid' 'pamixer' 'alsa-tools')
makedepends=('git')
source=("git+https://github.com/username227/${_pkgname}#tag=0.1")
sha256sums=('7afb2c6b90b4436f607cf050220599281c730c5e1bfe15556b22cd1597bf9195')

package() {
install -Dm755 $srcdir/$_pkgname/muteled -t $pkgdir/usr/bin
install -Dm644 $srcdir/$_pkgname/mute-led -t $pkgdir/etc/acpi/events
install -Dm755 $srcdir/$_pkgname/muteled.sh -t $pkgdir/etc/acpi/actions
}
