# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=pywws
pkgver=16.12.0
pkgrel=4
pkgdesc="Python software for USB Wireless WeatherStations"
arch=('any')
url="https://github.com/jim-easterbrook/pywws"
license=('GPL')
makedepends=('python2-pip')
depends=('python2-tzlocal')
options=(!emptydirs)
#backup=('etc/mpdlcd.conf')
source=(https://pypi.python.org/packages/e5/99/00bf9e1ee8eaa615f1fe9e63e7881d64b1e6eecfdfa4818cdb259cf9cfe8/$pkgname-$pkgver.tar.gz
'service')
md5sums=('6ea2679277c7887fd49fa0dbc6faea17'
         '7eda2524060c6fc0d4dcf3e10be9b7ee')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}"/service \
    "${pkgdir}"/usr/lib/systemd/system/pywws-livelog.service

}

# vim:set ts=2 sw=2 et:
