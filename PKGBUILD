# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-chkcryptoboot
pkgver=0.0.5
pkgrel=2
pkgdesc="This hook checks for a modified bootloader code, in an encrypted boot setup, and warns the user to not enter his root device password"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-chkcryptoboot"
license=('BSD')
depends=('bash')
install=$pkgname.install
backup=('etc/default/chkcryptoboot.conf')
source=('ChangeLog' "$pkgname.install" "${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
changelog='ChangeLog'
sha512sums=('87706e63d441a89fe652360e6962c4901f4ed76ec92f13321066af0e65d266d285cd76ffc1318d48cc52ab4e41756581f84ad4a4fa0b56d6f76d364ec882f33d'
            '2e0383688f77c87d0acbcbd5600beb00079d218bc6033251e6694aef86713f3687a1f963007fbc3337a4fd075adbed4529f07301cc0b1b532ede672611bd6e94'
            '5af63d22d5c348a578e58d2d81888f78ee03c6cc69046853ebfd856413e8a5d83328f1d26200b8e1647b02058f77b5271bdfb098a9de02606931a3eeffbeb428')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkcryptoboot.conf"	   "$pkgdir/etc/default/chkcryptoboot.conf"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkcryptoboot_hook"      "$pkgdir/usr/lib/initcpio/hooks/chkcryptoboot"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkcryptoboot_install"   "$pkgdir/usr/lib/initcpio/install/chkcryptoboot"
  install -Dm755 "${srcdir}/$pkgname-$pkgver"/chkcryptoboot-profilealert.sh "${pkgdir}"/etc/profile.d/chkcryptoboot-profilealert.sh
}
