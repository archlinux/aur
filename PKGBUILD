# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-utils
pkgver=0.0.2
pkgrel=2
pkgdesc="Collection of Archlinux mkinitcpio utilities performing various tasks"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-utils"
license=('BSD')
depends=('cryptsetup')
optdepends=('mkinitcpio-dropbear: Allow the encryptssh hook to unlock a root container remotely using dropbear' 'mkinitcpio-tinyssh: Allow the encryptssh hook to unlock a root container remotely using tinyssh')
install=$pkgname.install
changelog='ChangeLog'
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3740756b7f8808aa370749da69f5bcd3c817b225171d8aa38510400bbec2bbdadfab65ea44b0bd904a37100cc27f22146c21813d2b08cb73c869726a3169db0a')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/utils/shells/cryptsetup_shell"       "$pkgdir/usr/share/$pkgname/utils/shells/cryptsetup_shell"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md"                           "$pkgdir/usr/share/$pkgname/README.md"
  install -Dm644 "$srcdir/$pkgname-$pkgver/initcpio/hooks/encryptssh"           "$pkgdir/usr/lib/initcpio/hooks/encryptssh"
  install -Dm644 "$srcdir/$pkgname-$pkgver/initcpio/install/encryptssh"         "$pkgdir/usr/lib/initcpio/install/encryptssh"
}
