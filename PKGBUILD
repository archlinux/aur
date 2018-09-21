# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=pywws
pkgver=18.9.0
pkgrel=1
pkgdesc="Python software for USB Wireless WeatherStations"
arch=('any')
url="https://github.com/jim-easterbrook/pywws"
license=('GPL')
makedepends=('python2-pip')
depends=('python2-tzlocal')
options=(!emptydirs)
#backup=('etc/mpdlcd.conf')
source=(https://pypi.io/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz
'service')
md5sums=('45ed23a7237966c2f5b8b60864b7d533'
         '7eda2524060c6fc0d4dcf3e10be9b7ee')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}"/service \
    "${pkgdir}"/usr/lib/systemd/system/pywws-livelog.service

}

# vim:set ts=2 sw=2 et:
