# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-utils
pkgver=0.0.3
pkgrel=3
pkgdesc="Collection of Archlinux mkinitcpio utilities performing various tasks"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-utils"
license=('BSD')
depends=('cryptsetup')
optdepends=('mkinitcpio-dropbear: Allow the encryptssh hook to unlock a root container remotely using dropbear'
            'mkinitcpio-tinyssh: Allow the encryptssh hook to unlock a root container remotely using tinyssh')
#install=$pkgname.install
changelog='ChangeLog'
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9d454006978f23abca61be71523454670b94ea6d8e08eeab2e61fc81da3e3f5e8ec2b053fb0a6f986ce673d8521aa2a5b5fe5f37d4dffc4e27fde1b238437470')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/utils/shells/cryptsetup_shell"       "$pkgdir/usr/share/$pkgname/utils/shells/cryptsetup_shell"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md"                           "$pkgdir/usr/share/$pkgname/README.md"
  install -Dm644 "$srcdir/$pkgname-$pkgver/initcpio/hooks/encryptssh"           "$pkgdir/usr/lib/initcpio/hooks/encryptssh"
  install -Dm644 "$srcdir/$pkgname-$pkgver/initcpio/install/encryptssh"         "$pkgdir/usr/lib/initcpio/install/encryptssh"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE"                             "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
