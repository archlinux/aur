# Dominions 4 Server Configuration
# Maintainer: Dian Fay <dian.m.fay@gmail.com>
pkgname=dom4-server
pkgver=1.1.5
pkgrel=1
pkgdesc="Configure and run Dominions 4 as a headless server"
arch=("x86_64")
url="http://www.illwinter.com/dom4/"
license=("MIT")
install=$pkgname.install
depends_x86_64=("steamcmd")
source=(
  dom4-server
  dom4-server.service
  dom4-sysusers.conf
  dom4-tmpfile.conf
  dom4
)

package() {
  install -Dm744 "$srcdir/dom4-server" "$pkgdir/usr/bin/dom4-server"
  install -Dm644 "$srcdir/dom4-server.service" "$pkgdir/usr/lib/systemd/system/dom4-server.service"

  install -Dm755 "$srcdir/dom4" "$pkgdir/usr/bin/dom4"

  install -Dm644 "$srcdir/dom4-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/dom4.conf"
  install -Dm644 "$srcdir/dom4-tmpfile.conf" "$pkgdir/usr/lib/tmpfiles.d/dom4.conf"
}
md5sums=('372f6150c891165d1c1dc3a26477c7de'
         '7c6722df4f73b19e0db3c365f89eec96'
         'e9772a237cc540558e74235b98df8a7f'
         '338b8462868ecf6cc56c4a520cea6bac'
         '219c9aca46b988f031200263bcacc4de')
