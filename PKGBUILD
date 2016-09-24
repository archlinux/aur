# Dominions 4 Server Configuration
# Maintainer: Dian Fay <dian.m.fay@gmail.com>
pkgname=dom4-server
pkgver=1.0.6
pkgrel=1
pkgdesc="Configure and run Dominions 4 as a headless server"
arch=('x86_64')
url="http://www.illwinter.com/dom4/"
license=('MIT')
install=$pkgname.install
source=(
  dom4-server
  dom4-server.service
  dom4-sysusers.conf
  dom4-tmpfile.conf
  dom4
  default.properties
)

package() {
  install -Dm744 "$srcdir/dom4-server" "$pkgdir/usr/bin/dom4-server"
  install -Dm644 "$srcdir/dom4-server.service" "$pkgdir/usr/lib/systemd/system/dom4-server.service"

  install -Dm755 "$srcdir/dom4" "$pkgdir/usr/bin/dom4"

  install -Dm644 "$srcdir/default.properties" "$pkgdir/usr/share/dom4/config/default.properties"

  install -Dm644 "$srcdir/dom4-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/dom4.conf"
  install -Dm644 "$srcdir/dom4-tmpfile.conf" "$pkgdir/usr/lib/tmpfiles.d/dom4.conf"
}
md5sums=('d8e3011dfa108d3f1574c57aefcecb32'
         'd7467fb7a599236f71d428a85cf05014'
         'e9772a237cc540558e74235b98df8a7f'
         '338b8462868ecf6cc56c4a520cea6bac'
         '26c54faba6e1b864997cc918723c8db4'
         '22bdb16a296d12c51988c43c3218201b')
