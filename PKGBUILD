# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.5
pkgrel=1
pkgdesc="Minimalistic wpa_supplicant configuration manager"
arch=('any')
url='https://github.com/BiteDasher/wifiman'
license=('MIT')
depends=('bash' 'sudo' 'sed' 'net-tools' 'wireless_tools' 'wpa_supplicant' 'dhcpcd' 'systemd')
optdepends=(
	'zenity: Run wifigui'
)
provides=('wifigui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/wifiman/archive/${pkgver}.tar.gz")
sha256sums=("e64eb6b70717614c8b1eea6a787a017fa821f1409a941e5a7bb0dade7a716fbd")
package() {
mkdir -p $pkgdir/usr/bin
install -m 775 "$srcdir/$pkgname-$pkgver/wifiman" "$pkgdir/usr/bin/wifiman"
install -m 775 "$srcdir/$pkgname-$pkgver/wifigui" "$pkgdir/usr/bin/wifigui"
}
