# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-chkcryptoboot
pkgver=0.0.6
pkgrel=1
pkgdesc="This hook checks for a modified bootloader code, in an encrypted boot setup, and warns the user to not enter his root device password"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-chkcryptoboot"
license=('BSD')
depends=('bash')
#install=$pkgname.install
backup=('etc/default/chkcryptoboot.conf')
source=('ChangeLog' "${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
changelog='ChangeLog'
sha512sums=('da847e1ccd7ab71e1636285f9fa8dc6ed5e806842d4d098fbf44d250628621bce8e3925130b29860bf8d4b78e133edead26ae6e835450c572189d28e2d7d847b'
            'f907bf7182270158432b30953e66c74887cedb7aa01166fa46c5f848082d182ecc989e0e65efa860adc818fb4289c83af0bb25718e2f41775bc3a577318834b7')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkcryptoboot.conf"	   "$pkgdir/etc/default/chkcryptoboot.conf"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkcryptoboot_hook"      "$pkgdir/usr/lib/initcpio/hooks/chkcryptoboot"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkcryptoboot_install"   "$pkgdir/usr/lib/initcpio/install/chkcryptoboot"
  install -Dm755 "$srcdir/$pkgname-$pkgver"/chkcryptoboot-profilealert.sh "${pkgdir}"/etc/profile.d/chkcryptoboot-profilealert.sh
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
