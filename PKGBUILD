# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.8.4
pkgrel=1
pkgdesc="Minimalistic wpa_supplicant configuration manager"
arch=('any')
url='https://github.com/BiteDasher/wifiman'
license=('MIT')
depends=('bash' 'sed' 'wireless_tools' 'wpa_supplicant' 'systemd' 'dhcpcd')
optdepends=(
	'zenity: Run wifigui'
	'dhclient: DHCP client'
	'wifiman-indicator: LibAppIndicator support'
)
provides=('wifigui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/wifiman/archive/${pkgver}.tar.gz")
sha256sums=("ab5d200714b311dea7b775d3af4a92e77e7ad36f6c1d2f268bdb9caf9d2ac027")
package() {
cd $srcdir/$pkgname-$pkgver
make PREFIX="$pkgdir/usr" install
}
