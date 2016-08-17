# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sébastien Luttringer

pkgname=unifi-controller-beta
pkgver=5.2.3
_pkgver=aa0da1c8
pkgrel=1
pkgdesc='Controller for Ubiquiti UniFi accesspoints'
arch=('any')
url='http://www.ubnt.com/'
license=('custom')
depends=('mongodb' 'java-runtime')
provides=('unifi')
conflicts=('unifi')
backup=('opt/unifi/data/system.properties')
install=unifi.install
source=("https://www.ubnt.com/downloads/unifi/${pkgver}-${_pkgver}/UniFi.unix.zip"
        'unifi.service')
sha512sums=('dcc05ea0a27b1e5b18ebbb2b45835ebf85958db0b9234346b110f38b7117a232e91343d8344b2e1cff201c3ad8f025e119722b628aed5fe3711fd75e02bd960b'
            'eb6625d99634dee0298a961aaead6e3c504f2bf1c502ff071c52e46e8c0817e169ff2020d2e7bda9bac0f170c5214ec6939b14c16c6c6ce8da75ac6930ca2a47')

package() {
  install -d "$pkgdir/opt"
  cp -ar UniFi "$pkgdir/opt/unifi"
  chown -R 113:113 "$pkgdir/opt/unifi"
  rm "$pkgdir/opt/unifi/readme.txt"
  install -D -m 644 unifi.service "$pkgdir/usr/lib/systemd/system/unifi.service"
}
