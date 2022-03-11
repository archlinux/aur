# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Paul Sajna <sajattack at gmail dot com>

pkgname=fern-wifi-cracker
pkgver=3.4
pkgrel=2
groups=('blackarch' 'blackarch-cracker' 'blackarch-wireless')
pkgdesc='WEP, WPA wifi cracker for wireless penetration testing'
arch=('any')
url='https://github.com/savio-code/fern-wifi-cracker'
license=('GPL2')
depends=('python' 'python-pyqt5' 'aircrack-ng' 'subversion' 'scapy' 'macchanger')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'fern')
sha256sums=('f081f4105217c12a93683ffc3ded706d3f1cc1a573511c90d6e9980a425795c7'
            '028f5c7aad864ea9de2364bcc161e746b18a2dbbc5ff9480bef879da90802f16')

package() {
	install -D fern -t "$pkgdir/usr/bin/"
	cd "$pkgname-$pkgver/Fern-Wifi-Cracker"
	install -d "$pkgdir/usr/share/$pkgname/"
	cp -a --no-preserve=ownership * "$pkgdir/usr/share/$pkgname/"
	python -O -m compileall "$pkgdir/"
}
