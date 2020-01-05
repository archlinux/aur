# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=pywws
pkgver=19.7.1
pkgrel=2
pkgdesc="Python software for USB Wireless WeatherStations"
arch=('any')
url="https://github.com/jim-easterbrook/pywws"
license=('GPL')
makedepends=('python-pip')
depends=('python-tzlocal' 'python-pyusb')
options=(!emptydirs)
source=(https://pypi.io/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz
'service')
sha512sums=('9ca4a6b0fa225ee9fb5af014a5c33145d00d5ad2ed23d17d178bfdd6fec678d6155dec33ad3d77fe95f5eb6721f5be8c1f8a7443b94a6f4defcd33741120b379'
            '27ff5e179cf84beb4f534fcb908a04ef1d81f2d3a9d01365b46484cdba780970d5ea897e214b4cbfcf88ecfc19970589d892206f388d6e367cd926906d1faa16')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}"/service \
    "${pkgdir}"/usr/lib/systemd/system/pywws-livelog.service

}

# vim:set ts=2 sw=2 et:
