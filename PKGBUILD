pkgname=muteled
_pkgname=MuteLED
pkgver=0.2
pkgrel=1
arch=('x86_64')
pkgdesc='A simple script aiming to fix the broken mute LED light on some HP laptop models'
url='https://github.com/username227/MuteLED'
license=('GPL-3.0-or-later')
depends=('acpid' 'pamixer' 'alsa-tools')
makedepends=('git')
source=("git+https://github.com/username227/${_pkgname}#tag=$pkgver")
sha256sums=('3107c666149c56d00d9109ebb5503501c5942992b3c20e4e6230b63a606d5668')

package() {
install -Dm755 $srcdir/$_pkgname/muteled -t $pkgdir/usr/bin
install -Dm644 $srcdir/$_pkgname/mute-led -t $pkgdir/etc/acpi/events
install -Dm755 $srcdir/$_pkgname/muteled.sh -t $pkgdir/etc/acpi/actions
}
