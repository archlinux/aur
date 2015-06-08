# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-chkcryptoboot
pkgver=0.0.4
pkgrel=1
pkgdesc="This hook checks for a modified bootloader code, in an encrypted boot setup, and warns the user to not enter his root device password"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-chkcryptoboot"
license=('BSD')
install=$pkgname.install
backup=('etc/default/chkcryptoboot.conf')
source=('ChangeLog' "$pkgname.install" $url/archive/v$pkgver.tar.gz)
changelog='ChangeLog'
sha512sums=('1732bce81fc0011a0191731c114cff8c7e50cbf86ffb00d8e9f32840eb5b32923bad731e2711182d39d881a21987d057b6f8d74da5ba1b5721ead1a1473d9505'
            'dd1ec73389b65f8772d880ca13ea4298a9a8c2d6b8db0201f0385f1495e370b95e4e50bbd654c51f61db8f1aaca6e8958ce55127361263234a95d0a479c99f5b'
            '2257a89c78f1cbf3e04124f469d30c5f72e1136de62fe43d040573036b91ae63e6f8577bb4065b33b7c94b745a70f23ae68d7ff2952a18e7c3fcddc23e50b712')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkcryptoboot.conf"	   "$pkgdir/etc/default/chkcryptoboot.conf"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkcryptoboot_hook"      "$pkgdir/usr/lib/initcpio/hooks/chkcryptoboot"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkcryptoboot_install"   "$pkgdir/usr/lib/initcpio/install/chkcryptoboot"
  install -Dm755 "${srcdir}/$pkgname-$pkgver"/chkcryptoboot-profilealert.sh "${pkgdir}"/etc/profile.d/chkcryptoboot-profilealert.sh
}
