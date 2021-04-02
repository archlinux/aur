# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=pywws
pkgver=21.4.0
pkgrel=1
pkgdesc="Python software for USB Wireless WeatherStations"
arch=('any')
url="https://github.com/jim-easterbrook/pywws"
license=('GPL')
makedepends=('python-pip')
depends=('python-tzlocal' 'python-pyusb')
options=(!emptydirs)
source=(https://pypi.io/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz
'service')
sha512sums=('ce38a087c4910632c3fdf9d14abc5c61d9b46a66e1c246965d481e626687bf39ee2ad718f8c28bb194774d197cb7ea415e3dc478c131f0c7bb0cb51f7bb5c34c'
            '27ff5e179cf84beb4f534fcb908a04ef1d81f2d3a9d01365b46484cdba780970d5ea897e214b4cbfcf88ecfc19970589d892206f388d6e367cd926906d1faa16')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}"/service \
    "${pkgdir}"/usr/lib/systemd/system/pywws-livelog.service

}

# vim:set ts=2 sw=2 et:
