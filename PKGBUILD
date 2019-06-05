# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor (backup): Thomas Fanninger <thomas at fanninger dot at>

pkgname=linx-server
pkgver=2.1.5
pkgrel=1
pkgdesc='Self-hosted file/code/media sharing website '
arch=('i686' 'x86_64' 'arm')
url='https://github.com/andreimarcu/linx-server'
license=('GPL')
install=linx-server.install
options=('!strip')
noextract=('linx-server')
backup=('etc/webapps/linx-server/config.ini')

source=('linx-server.service' 'config.ini')
md5sums=('ff2e46fa6491fb58f24294e037092799'
         '8c2fe5caef5e0477d0da15cc0d947337')
md5sums_i686=('752b6e9fd421317827d5db517fb75966')
md5sums_x86_64=('78d52f84b5e45e6a664e008f710e4146')
md5sums_arm=('55e1ae07f21fe818ce7499b4107ed6a0')

source_i686=("linx-server::https://github.com/andreimarcu/linx-server/releases/download/v$pkgver/linx-server-v${pkgver}_linux-386")

source_x86_64=("linx-server::https://github.com/andreimarcu/linx-server/releases/download/v$pkgver/linx-server-v${pkgver}_linux-amd64")

source_arm=("linx-server::https://github.com/andreimarcu/linx-server/releases/download/v$pkgver/linx-server-v${pkgver}_linux-arm")


package() {
  cd $srcdir
  install -Dm755 linx-server "$pkgdir/usr/bin/linx-server"
  install -Dm644 config.ini "$pkgdir/etc/webapps/linx-server/config.ini"
  install -Dm644 linx-server.service "$pkgdir/usr/lib/systemd/system/linx-server.service"
  install -d "$pkgdir/usr/share/webapps/linx-server/"
}
