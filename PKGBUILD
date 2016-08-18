# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sébastien Luttringer

pkgname=unifi-controller-beta
pkgver=5.3.1
_pkgver=9eae3aa2
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
sha512sums=('9c1d275d4cf1db989d10c93c5e4ff96c87337ffc12b4449ee9a67c81a21babf94c00ac0fd42e22cc45eeca1ebc98fa3135aa99392f7b3d5669abe456d66b4af1'
            'eb6625d99634dee0298a961aaead6e3c504f2bf1c502ff071c52e46e8c0817e169ff2020d2e7bda9bac0f170c5214ec6939b14c16c6c6ce8da75ac6930ca2a47')

package() {
  install -d "$pkgdir/opt"
  cp -ar UniFi "$pkgdir/opt/unifi"
  chown -R 113:113 "$pkgdir/opt/unifi"
  rm "$pkgdir/opt/unifi/readme.txt"
  install -D -m 644 unifi.service "$pkgdir/usr/lib/systemd/system/unifi.service"
}
