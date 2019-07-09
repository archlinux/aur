# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=pywws
pkgver=19.7.0
pkgrel=1
pkgdesc="Python software for USB Wireless WeatherStations"
arch=('any')
url="https://github.com/jim-easterbrook/pywws"
license=('GPL')
makedepends=('python-pip')
depends=('python-tzlocal' 'python-libusb1')
options=(!emptydirs)
source=(https://pypi.io/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz
'service')
sha512sums=('383eb1b70cb15a3fffd1ece94fef89337890344d5d78f92e0f91bdddf5f4c40ad4da1e9c5f6cc68e1e621358459f3362c6d6a9fd5298b580aee6ea303b49a446'
            '27ff5e179cf84beb4f534fcb908a04ef1d81f2d3a9d01365b46484cdba780970d5ea897e214b4cbfcf88ecfc19970589d892206f388d6e367cd926906d1faa16')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}"/service \
    "${pkgdir}"/usr/lib/systemd/system/pywws-livelog.service

}

# vim:set ts=2 sw=2 et:
