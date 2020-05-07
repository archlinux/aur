# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.7.3
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
sha256sums=("7fa57301166193d0b94003ac322feb4739cbb2e3efa536ef9f8f81c3f1507906")
package() {
cd $srcdir/$pkgname-$pkgver
make PREFIX="$pkgdir/usr" install
}
