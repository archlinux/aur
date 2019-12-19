# Dominions Server Configuration
# Maintainer: Dian Fay <dian.m.fay@gmail.com>
pkgname=dominions-server
pkgver=5
pkgrel=1
pkgdesc="Configure and run Dominions 5 as a headless server"
arch=("x86_64")
url="http://www.illwinter.com/dom5/"
license=("MIT")
install=$pkgname.install
depends_x86_64=("steamcmd")
source=(
  dominions-server
  dominions-server.service
  dominions-sysusers.conf
  dominions-tmpfile.conf
  dominions
)
replaces=("dom4-server")

package() {
  install -Dm744 "$srcdir/dominions-server" "$pkgdir/usr/bin/dominions-server"
  install -Dm644 "$srcdir/dominions-server.service" "$pkgdir/usr/lib/systemd/system/dominions-server.service"

  install -Dm755 "$srcdir/dominions" "$pkgdir/usr/bin/dominions"

  install -Dm644 "$srcdir/dominions-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/dominions.conf"
  install -Dm644 "$srcdir/dominions-tmpfile.conf" "$pkgdir/usr/lib/tmpfiles.d/dominions.conf"
}
md5sums=('1c50c7bf2b0bd067f1749c9153bd4c36'
         '8194de8c40005e24334d6c402fcc97e1'
         'b1db7bda72a917fed819d1251361b1ca'
         '0c20183b083e3927a5a49771cd530004'
         '5ecfb39e75cb603afaeaae8a32921288')
