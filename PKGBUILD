# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-utils
pkgver=0.0.1
pkgrel=3
pkgdesc="Collection of Archlinux mkinitcpio utilities performing various tasks"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-utils"
license=('BSD')
depends=('cryptsetup')
optdepends=('mkinitcpio-dropbear: Allow the encryptssh hook to unlock a root container remotely using dropbear' 'mkinitcpio-tinyssh: Allow the encryptssh hook to unlock a root container remotely using tinyssh')
conflicts=('dropbear_initrd_encrypt')
install=$pkgname.install
changelog='ChangeLog'
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('5d7f91e0d5a5d437d941eba6e3e944125f89a0e18e72d2ee464030e03a2cc2d96b38d0346521c9876e25bd8e4c094cd897dafb3e0dcd2c95dd98b9b20d2aad47')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/utils/shells/cryptsetup_shell"       "$pkgdir/usr/share/$pkgname/utils/shells/cryptsetup_shell"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md"                           "$pkgdir/usr/share/$pkgname/README.md"
  install -Dm644 "$srcdir/$pkgname-$pkgver/initcpio/hooks/encryptssh"           "$pkgdir/usr/lib/initcpio/hooks/encryptssh"
  install -Dm644 "$srcdir/$pkgname-$pkgver/initcpio/install/encryptssh"         "$pkgdir/usr/lib/initcpio/install/encryptssh"
}
