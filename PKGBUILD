# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-ddns
pkgver=0.0.2
pkgrel=5
pkgdesc="This hook provides dynamic dns capabilities to the initramfs"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-ddns"
license=('BSD')
depends=('inadyn-mt')
optdepends=('mkinitcpio-netconf: early userspace network configuration' 'mkinitcpio-ppp: dial to a provider to establish internet connection')
#install=$pkgname.install
source=('ChangeLog' "${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
changelog='ChangeLog'
sha256sums=('b16f81f121f05c3985fa2f45679def7d6cf97b65690fac43c3f56f4f06d8411f'
            '7c9ac2475ec71faf382c669492711412e8fdcca49529475063f3111a3a9dcce0')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/ddns_hook"      "$pkgdir/usr/lib/initcpio/hooks/ddns"
  install -Dm644 "$srcdir/$pkgname-$pkgver/ddns_install"   "$pkgdir/usr/lib/initcpio/install/ddns"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
