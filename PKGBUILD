# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=pywws
pkgver=21.3.0
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
sha512sums=('1536c0b55c3f867f2b4a992a82940150e9e0341d93078e493bd887f31f1556abb9522abca1d84a834867d6fc1de92e59d732b97ea537be5fdf9c7a4a4548d741'
            '27ff5e179cf84beb4f534fcb908a04ef1d81f2d3a9d01365b46484cdba780970d5ea897e214b4cbfcf88ecfc19970589d892206f388d6e367cd926906d1faa16')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}"/service \
    "${pkgdir}"/usr/lib/systemd/system/pywws-livelog.service

}

# vim:set ts=2 sw=2 et:
