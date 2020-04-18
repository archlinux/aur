# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.0
pkgrel=2
pkgdesc="Minimalistic wpa_supplicant configuration manager"
arch=('any')
url='https://github.com/BiteDasher/wifiman'
license=('MIT')
depends=('bash' 'sudo' 'sed' 'net-tools' 'wireless_tools' 'wpa_supplicant' 'dhclient' 'systemd')
optdepends=(
	'zenity: Run wifigui'
)
provides=('wifigui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/wifiman/archive/${pkgver}.tar.gz")
sha256sums=("653bd97caf2c4218852f6a290e52b6552f0709a20b29fb44c309436d250b5a7e")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
install -m 775 wifiman "$pkgdir/usr/bin/wifiman"
install -m 775 wifigui "$pkgdir/usr/bin/wifigui"
}
