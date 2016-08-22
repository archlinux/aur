# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=linx-server
pkgver=1.2.3
pkgrel=1
pkgdesc='Self-hosted file/code/media sharing website '
arch=('i686' 'x86_64' 'arm')
url='https://github.com/andreimarcu/linx-server'
license=('GPL')
install=linx-server.install
options=('!strip')
noextract=('linx-server')

source=('linx-server.service' 'config.ini')
md5sums=('7681dc2e6633526b0c5a27ee9cd0fa2b' '8c2fe5caef5e0477d0da15cc0d947337')

source_i686=("linx-server::https://github.com/andreimarcu/linx-server/releases/download/v$pkgver/linx-server-v${pkgver}_linux-386")
md5sums_i686=('172985f2c1138f190928ba6f388ba0af')

source_x86_64=("linx-server::https://github.com/andreimarcu/linx-server/releases/download/v$pkgver/linx-server-v${pkgver}_linux-amd64")
md5sums_x86_64=('6512ec816e2d379cdba1297cfa36e5c7')

source_arm=("linx-server::https://github.com/andreimarcu/linx-server/releases/download/v$pkgver/linx-server-v${pkgver}_linux-arm")
md5sums_arm=('abf8316be24b2de71b2ce4622d021c91')


package() {
  cd $srcdir
  install -Dm755 linx-server "$pkgdir/usr/bin/linx-server"
  install -Dm644 config.ini "$pkgdir/etc/webapps/linx-server/config.ini"
  install -Dm644 linx-server.service "$pkgdir/usr/lib/systemd/system/linx-server.service"
  install -d "$pkgdir/usr/share/webapps/linx-server/"
}
