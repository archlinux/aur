# Maintainer: Riccardo Berto <riccardobrt@gmail.com>

pkgbase=python-pyowm
pkgname=('python-pyowm')
_pkgname=pyowm
pkgver=2.9.0
pkgrel=2
pkgdesc="A Python wrapper around the OpenWeatherMap API"
arch=('any')
url="https://github.com/csparpa/pyowm"
license=('MIT')
depends=('python-requests' 'python-geojson')
makedepends=('python-setuptools')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('SKIP')

package() {
depends=('python')

    cd $_pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1

    chmod -R a+r $pkgdir/usr/lib/python*/site-packages/*info/

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

