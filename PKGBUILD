# Maintainer: Kenny Strawn <Kenny.Strawn@gmail.com>

pkgname=autoupdate-yay
pkgver=4
pkgrel=1
pkgdesc="Automatically update ALL packages, including those installed from the AUR, in the background"
arch=('any')
url="https://aur.archlinux.org/packages/autoupdate-yay/"
license=('GPL')
depends=('yay')
conflicts=('autoupdate')
install=autoupdate.install
source=(autoupdate.service
        autoupdate.timer)
md5sums=('SKIP'
         'SKIP')

package() {
  targetdir="$pkgdir/usr/lib/systemd/system/"
  install -m 755 -d $targetdir

  install -D -m644 autoupdate.{service,timer} $targetdir
}

# vim:set ts=2 sw=2 et:
