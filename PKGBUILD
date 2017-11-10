# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=pywws
pkgver=17.11.0
pkgrel=1
pkgdesc="Python software for USB Wireless WeatherStations"
arch=('any')
url="https://github.com/jim-easterbrook/pywws"
license=('GPL')
makedepends=('python2-pip')
depends=('python2-tzlocal')
options=(!emptydirs)
#backup=('etc/mpdlcd.conf')
source=(https://pypi.python.org/packages/49/ed/cd05eff0177b569c60230db5c13aded51355aada59f7f9d441d2d1353c4f/$pkgname-$pkgver.tar.gz
'service')
md5sums=('ab44b23076efb9982ee2343ccf0d2ab0'
         '7eda2524060c6fc0d4dcf3e10be9b7ee')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}"/service \
    "${pkgdir}"/usr/lib/systemd/system/pywws-livelog.service

}

# vim:set ts=2 sw=2 et:
