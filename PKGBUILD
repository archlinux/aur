# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-ddns
pkgver=0.0.2
pkgrel=1
pkgdesc="This hook provides dynamic dns capabilities to the initramfs. It is meant for use with dropbear_initrd_encrypt and mkinitcpio-ppp for remote unlocking the luks root partition over the internet"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-ddns"
license=('BSD')
depends=('inadyn-mt')
optdepends=('dropbear_initrd_encrypt: for setting a gateway using ip= parameter' 'mkinitcpio-ppp: dial to a provider to establish internet connection')
install=$pkgname.install
source=('ChangeLog' "$pkgname.install" $url/archive/v$pkgver.tar.gz)
changelog='ChangeLog'
sha256sums=('b16f81f121f05c3985fa2f45679def7d6cf97b65690fac43c3f56f4f06d8411f'
            'f967435d494ec9d4980df1bfd6f3ca6738ebd0e2544c4e079ce31603dea5b7f6'
            '7c9ac2475ec71faf382c669492711412e8fdcca49529475063f3111a3a9dcce0')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/ddns_hook"      "$pkgdir/usr/lib/initcpio/hooks/ddns"
  install -Dm644 "$srcdir/$pkgname-$pkgver/ddns_install"   "$pkgdir/usr/lib/initcpio/install/ddns"
}
