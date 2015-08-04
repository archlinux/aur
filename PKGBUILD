# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-tinyssh
pkgver=0.0.1
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook to install and enable the tinyssh daemon in early userspace"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-tinyssh"
license=('BSD')
depends=('psmisc' 'tinyssh' 'ucspi-tcp')
optdepends=('mkinitcpio-netconf: Network interface configuration' 'mkinitcpio-ppp: PPP interface configuration')
conflicts=('dropbear_initrd_encrypt' 'mkinitcpio-dropbear')
install=$pkgname.install
source=($url/archive/v$pkgver.tar.gz)
changelog='ChangeLog'
sha512sums=('e05a6dce2664c315ce37987b551a1315284491b8df57e3978bfe258cb8f690699d77ea915d2059099034b14a66ccc0a73f7d103d0bb0d4c0314e9e7479f67774')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/tinyssh_hook"      "$pkgdir/usr/lib/initcpio/hooks/tinyssh"
  install -Dm644 "$srcdir/$pkgname-$pkgver/tinyssh_install"   "$pkgdir/usr/lib/initcpio/install/tinyssh"
}
