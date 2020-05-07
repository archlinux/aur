# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.8
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
sha256sums=("005d6e9d2c44fd5b8ec401a2cb631b8a354345a768d0d77a4ca753b42d2b7996")
package() {
cd $srcdir/$pkgname-$pkgver
make PREFIX="$pkgdir/usr" install
}
