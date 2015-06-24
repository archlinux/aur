pkgname="gutbackup"
pkgver=3.0.1
pkgrel=1
pkgdesc="the simplest rsync wrapper for backup Linux system. PKGBUILD file is located at https://github.com/gutenye/aur/tree/master/gutbackup"
arch=("any")
url="https://github.com/gutenye/gutbackup"
license=("MIT")
depends=("rsync")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gutenye/gutbackup/archive/v$pkgver.tar.gz"
)
md5sums=('3fa76c7ddca1c274031da8e581a8e000')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/gutbackup"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp -r bin libexec "$pkgdir/usr/share/gutbackup"
  cp misc/*.{service,timer} "$pkgdir/usr/lib/systemd/system"
  ln -s "/usr/share/gutbackup/bin/gutbackup" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
