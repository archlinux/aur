# Maintainer: philanecros <philanecros@gmail.com>

pkgname=autoupdate
pkgver=4
pkgrel=1
pkgdesc="Download packages to update automatically."
arch=('any')
url="https://aur.archlinux.org/packages/autoupdate/"
license=('GPL')
install=autoupdate.install
source=(autoupdate.service
        autoupdate.timer)
md5sums=('5239b232d6c877887c3f87a99ffa1ab8'
         '129db06fab0fd9478ef3a4cf6a5baa96')
depends=(timeshift-autosnap)
package() {
  targetdir="$pkgdir/usr/lib/systemd/system/"
  install -m 755 -d $targetdir

  install -D -m644 autoupdate.{service,timer} $targetdir
}

# vim:set ts=2 sw=2 et:
