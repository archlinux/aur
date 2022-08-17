# Maintainer: JianQing Liu <me at pegasis dot site>
pkgname=reemod-bin
pkgver=1.8.2
pkgrel=2
pkgdesc="Low latency desktop streaming for everyone"
arch=('x86_64')
url="https://reemo.io/"
license=('unknown')
provides=('reemod')
depends=('ffmpeg' 'glib2' 'libpulse' 'libx11' 'libxcb' 'libxtst')
makedepends=()
source=("$pkgname-$pkgver.deb::https://download.reemo.io/linux/deb/$pkgver/jammy/reemo.deb" 
'reemod.service::https://download.reemo.io/linux/deb/reemod.service' 
'reemo.ini')
md5sums=('bf18fe8676f6fae783e4e0e9c579748f' 
'bc60c405a23e954f5f41a02fbf217022' 
'e016da41d1e4fe4b3ab9687cf9e4e108')
install='INSTALL'


package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
    install -Dm644 reemod.service "$pkgdir/etc/systemd/system/reemod.service"
    install -Dm644 reemo.ini "$pkgdir/opt/reemo/reemo.ini"
}
