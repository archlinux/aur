# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.8.6
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
sha256sums=("0b9f5d258cc6d654636d5f21cdc7c8b80497e5a21fd56c63880cdae802ad8d3d")
package() {
cd $srcdir/$pkgname-$pkgver
make PREFIX="$pkgdir/usr" install
}
