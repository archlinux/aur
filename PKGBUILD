# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-netconf
pkgver=0.0.4
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook for configuring early userspace networking"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-netconf"
license=('BSD')
depends=('mkinitcpio-nfs-utils' 'iproute2')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
changelog='Changelog'
sha512sums=('06ac202410964740785d2977f7918981276e10568260433436c51a1d540152cc28462e46dae6bfa31acd1fafa9ebe1e4f57ca90d7754a09ccaba142c8d48b228')

package() {
  install -Dm644 $srcdir/$pkgname-$pkgver/netconf_hook      $pkgdir/usr/lib/initcpio/hooks/netconf
  install -Dm644 $srcdir/$pkgname-$pkgver/netconf_install   $pkgdir/usr/lib/initcpio/install/netconf
  install -Dm644 $srcdir/$pkgname-$pkgver/LICENSE           $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
