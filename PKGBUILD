# Maintainer: Eric Chu <eric@ericchu.net>
pkgname=shomepass
pkgver=v2.3.r0.g5cc2445
pkgrel=1
pkgdesc='A simple homepass implementation'
arch=('any')
url='https://github.com/ericchu94/shomepass'
license=('GPL')
depends=('hostapd')
source=('git+https://github.com/ericchu94/shomepass.git')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p $pkgdir/etc/shomepass/
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/systemd/system/

  cd "$pkgname"
  cp shomepass.conf.example $pkgdir/etc/shomepass/
  cp shomepass $pkgdir/usr/bin/
  cp shomepass.service $pkgdir/usr/lib/systemd/system/
}
