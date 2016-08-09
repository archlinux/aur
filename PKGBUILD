# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-tinyssh
pkgver=0.0.2
pkgrel=2
pkgdesc="Archlinux mkinitcpio hook to install and enable the tinyssh daemon in early userspace"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-tinyssh"
license=('BSD')
depends=('psmisc' 'tinyssh' 'ucspi-tcp')
optdepends=('mkinitcpio-netconf: Network interface configuration' 'mkinitcpio-ppp: PPP interface configuration')
conflicts=('mkinitcpio-dropbear')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
changelog='ChangeLog'
sha512sums=('c5f98362d29a0a83aa3da04fc590ffbcff544efb202f218746924beb7d4c568eaad823bade673ba7bfdd428903057bdf2db42acfacff2159d73e5de7b24f539f')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/tinyssh_hook"      "$pkgdir/usr/lib/initcpio/hooks/tinyssh"
  install -Dm644 "$srcdir/$pkgname-$pkgver/tinyssh_install"   "$pkgdir/usr/lib/initcpio/install/tinyssh"
}
