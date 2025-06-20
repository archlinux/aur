# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-utils
pkgver=0.0.5
pkgrel=1
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
sha512sums=('987fa4e2a944d415a5cc336010c33fdbb04e8a49793309a36762b5d5f9ba421eac8f7d403c856ca24f42e3a091726298dadad624c25fcb53d041d24020152bd1')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/utils/shells/cryptsetup_shell"       "$pkgdir/usr/share/$pkgname/utils/shells/cryptsetup_shell"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md"                           "$pkgdir/usr/share/$pkgname/README.md"
  install -Dm644 "$srcdir/$pkgname-$pkgver/initcpio/hooks/encryptssh"           "$pkgdir/usr/lib/initcpio/hooks/encryptssh"
  install -Dm644 "$srcdir/$pkgname-$pkgver/initcpio/install/encryptssh"         "$pkgdir/usr/lib/initcpio/install/encryptssh"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE"                             "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
