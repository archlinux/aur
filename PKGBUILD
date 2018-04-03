# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=pywws
pkgver=18.4.0
pkgrel=1
pkgdesc="Python software for USB Wireless WeatherStations"
arch=('any')
url="https://github.com/jim-easterbrook/pywws"
license=('GPL')
makedepends=('python2-pip')
depends=('python2-tzlocal')
options=(!emptydirs)
#backup=('etc/mpdlcd.conf')
source=(https://pypi.python.org/packages/a8/fb/8bc5f15f2dd237f03ec197509c4d819eab8eb91df917a0eb8571a78f0fc0/$pkgname-$pkgver.tar.gz
'service')
md5sums=('9140e1ae82d877dfd85331582150668e'
         '7eda2524060c6fc0d4dcf3e10be9b7ee')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}"/service \
    "${pkgdir}"/usr/lib/systemd/system/pywws-livelog.service

}

# vim:set ts=2 sw=2 et:
