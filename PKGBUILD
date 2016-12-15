# Maintainer: Adrian Lopez <adrianlzt@gmail.com>
pkgname=droidmote
pkgver=3.0.0
pkgrel=1
pkgdesc="Server for DroidMote. Use your androd as remote mouse and keyboard."
arch=("x86_64")
url="http://www.videomap.it/"
license=('unknown')
depends=("libx11")
backup=("etc/$pkgname.conf")
source=("https://github.com/adrianlzt/${pkgname}-aur/releases/download/$pkgver/$pkgname"
        "${pkgname}.conf"
        "service")
md5sums=('7f96c828660a6e844d4e5b3757eee198'
         '13c6e42310e9be9b464a3b99149e06b0'
         '83d4fbce1dd8dc2c51c89e480329b879')

package() {
  install -D ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.conf "${pkgdir}"/etc/${pkgname}.conf
  install -Dm644 service "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
}
