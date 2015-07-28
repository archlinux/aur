# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-dropbear
pkgver=0.0.2
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook to install and enable the dropbear daemon in early userspace"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-dropbear"
license=('GPL3')
depends=('dropbear' 'psmisc')
optdepends=('openssh: Allows the use of the same host keys used for normal access' 'mkinitcpio-netconf: Network interface configuration' 'mkinitcpio-ppp: PPP interface configuration')
conflicts=('dropbear_initrd_encrypt')
install=$pkgname.install
source=($url/archive/v$pkgver.tar.gz)
changelog='ChangeLog'
sha512sums=('3fe0d9bbec71e0957003410ca1487b30d0fe97dc86bf1282135c041eaf92cce1488809ee918e0fbc27ec57e7fc8e4ae2fcd76276e662a69f3ca97e98573255d8')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/dropbear_hook"      "$pkgdir/usr/lib/initcpio/hooks/dropbear"
  install -Dm644 "$srcdir/$pkgname-$pkgver/dropbear_install"   "$pkgdir/usr/lib/initcpio/install/dropbear"
}
