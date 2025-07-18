# Maintainer: chocolateimage <chocolateimage@protonmail.com>
pkgname=alarm-clock
pkgver=1.4.0
pkgrel=1
pkgdesc="A simple alarm clock with Outlook reminder integration"
url="https://github.com/chocolateimage/alarm-clock"
license=('GPL-3.0-only')
arch=("x86_64")
depends=(
	'python'
	'python-pyqt6'
	'python-requests'
)
optdepends=(
	'python-selenium: Outlook integration support'
	'selenium-manager: Outlook integration support - Auto installation of ChromeDriver'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/chocolateimage/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1aba1ab3ef05aa880072e7647ae4f4f4c28fe3f2fd9a342b247053aeeae3e336')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/share/applications/"

	cp "alarm-clock.py" "$pkgdir/usr/bin/alarm-clock"
	cp "alarm-clock.desktop" "$pkgdir/usr/share/applications/"
}
