# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=pywws
pkgver=20.1.0
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
sha512sums=('8566873278a6d6193de564db5c7d4706653347731efa4676f85f3a07c4d45a909caeb78a638e5772ed1ea5eb68b1f472b116b19f663421c5d452f528fa4b7290'
            '27ff5e179cf84beb4f534fcb908a04ef1d81f2d3a9d01365b46484cdba780970d5ea897e214b4cbfcf88ecfc19970589d892206f388d6e367cd926906d1faa16')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}"/service \
    "${pkgdir}"/usr/lib/systemd/system/pywws-livelog.service

}

# vim:set ts=2 sw=2 et:
