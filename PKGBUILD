# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.0
pkgrel=3
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
sha256sums=("147a36594e39bd4f3ab748336025626f3316c81404ffb5908e607d39fefd5a55")
package() {
mkdir -p $pkgdir/usr/bin
cd "$srcdir/$pkgname-$pkgver"
install -m 775 wifiman "$pkgdir/usr/bin/wifiman"
install -m 775 wifigui "$pkgdir/usr/bin/wifigui"
}
