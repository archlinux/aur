# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-geoip2
pkgver=2.9.0
pkgrel=1
pkgdesc='Python code for GeoIP2 website client and database reader'
arch=(any)
url=https://geoip2.readthedocs.org/en/latest/
license=(Apache)
depends=(python-requests
         python-maxminddb)
makedepends=(python-setuptools)
source=(https://github.com/maxmind/GeoIP2-python/archive/v$pkgver.tar.gz)
sha512sums=('8631a41d9644887d0149678e40a5f9d03bba660853c308c43bf358cd49b3f021566b9d6f65b670c0c1c78bcb4cb7cb007ad2db6f3c032749afa454fc9e06d74c')

package() {
  cd GeoIP2-python-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
