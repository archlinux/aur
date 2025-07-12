# Maintainer: MojArch

pkgname=fnlock
pkgver=2.0
pkgrel=1
pkgdesc="A systemd service to toggle Fn Lock using Ctrl, Shift, and Alt keys for Lenovo laptops"
arch=('any')
url="https://github.com/yourrepo/FnLock"
license=('GPL3')
depends=(
	'python'
	'python-evdev'
)
source=(
	"FnLock.py"
	"FnLock.service"
)

sha256sums=(
	'848205c651d18d49b11fd27de543dacca98db0f06282190207e6150ef280af81' 
	'6a684ccf742fa9e6e52a593925f8b2580408fb01fd05cba050605ab81cdf186c'
)

package() {
    install -Dm755 "$srcdir/FnLock.py" "$pkgdir/usr/bin/FnLock"
    install -Dm644 "$srcdir/FnLock.service" "$pkgdir/usr/lib/systemd/system/FnLock.service"
    install -Dm644 /dev/null "$pkgdir/usr/lib/systemd/system-preset/99-FnLock.preset"
    echo "enable FnLock.service" > "$pkgdir/usr/lib/systemd/system-preset/99-FnLock.preset"
}

