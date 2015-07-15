# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-dropbear
pkgver=0.0.1
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook to install and enable the dropbear daemon in early userspace"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-dropbear"
license=('GPL3')
depends=('dropbear' 'psmisc')
conflicts=('dropbear_initrd_encrypt')
optdepends=('openssh: Allows the use of the same host keys used for normal access')
install=$pkgname.install
source=($url/archive/v$pkgver.tar.gz)
changelog='ChangeLog'
sha512sums=('a4c4d91d27638d9f045b4321fd232cf86d9fb5aa45e59299108c794da4770bab33d444c2c518867fae3c1c9bb91099ab5ad9d149fca229a236d15e98f38283c5')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/dropbear_hook"      "$pkgdir/usr/lib/initcpio/hooks/dropbear"
  install -Dm644 "$srcdir/$pkgname-$pkgver/dropbear_install"   "$pkgdir/usr/lib/initcpio/install/dropbear"
}
