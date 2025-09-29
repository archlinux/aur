# stolen from https://aur.archlinux.org/packages/mkinitcpio-tor/
pkgname=mkinitcpio-tor-http
pkgver=0.0.5
pkgrel=2
pkgdesc="Arch Linux mkinitcpio hook for running tor on the initramfs and requesting decryption keys"
arch=('any')
license=('BSD')
depends=('tor' 'jq' 'mkinitcpio-netconf' 'ntp')
source=('torhttp_hook' 'torhttp_install' 'torrc' 'config.sh')

package() {
  install -Dm644 "$srcdir/torhttp_hook"      "$pkgdir/usr/lib/initcpio/hooks/torhttp"
  install -Dm644 "$srcdir/torhttp_install"   "$pkgdir/usr/lib/initcpio/install/torhttp"
  install -Dm644 "$srcdir/torrc"   "$pkgdir/usr/share/$pkgname/torrc"
  install -Dm644 "$srcdir/config.sh"   "$pkgdir/usr/share/$pkgname/config.sh"
}



md5sums=('384ae94cd968872ec3b17bd298edf70e'
         '92af5f67eb7b47e2683e0c75283a4f1a'
         'ccc836fedcd716ab0da09359d8b43cff'
         '224d2ffff3ce14195bf5066aa293e8dd')
