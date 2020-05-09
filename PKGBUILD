# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.8.3
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
sha256sums=("7ce1719869273486c9c2f5f585cf079f1c4d95403dad84c2b519381dd7f55829")
package() {
cd $srcdir/$pkgname-$pkgver
make PREFIX="$pkgdir/usr" install
}
