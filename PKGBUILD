# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sébastien Luttringer

pkgname=unifi-beta
pkgver=5.4.11
_pkgver=6cbeae59e7
pkgrel=1
pkgdesc='Controller for Ubiquiti UniFi accesspoints'
arch=('any')
url='http://www.ubnt.com/'
license=('custom')
depends=('mongodb' 'java-runtime')
provides=('unifi')
conflicts=('unifi' 'unifi-controller-beta')
replaces=('unifi-controller-beta')
backup=('opt/unifi/data/system.properties')
install=unifi.install
source=(https://www.ubnt.com/downloads/unifi/${pkgver}-${_pkgver}/UniFi.unix.zip
        unifi.service)
sha512sums=('7fff7e41ea0ce7197556373ebdaae63a2b0b836f1d504d100d602207f6bd88477ca4b2b1267803920f3fba8487887c6d0bb5dc4f16e93ff1440eef04fcae9429'
            'eb6625d99634dee0298a961aaead6e3c504f2bf1c502ff071c52e46e8c0817e169ff2020d2e7bda9bac0f170c5214ec6939b14c16c6c6ce8da75ac6930ca2a47')

package() {
  install -d ${pkgdir}/opt
  cp -ar UniFi ${pkgdir}/opt/unifi
  chown -R 113:113 ${pkgdir}/opt/unifi
  rm ${pkgdir}/opt/unifi/readme.txt
  install -D -m 644 unifi.service ${pkgdir}/usr/lib/systemd/system/unifi.service
}
