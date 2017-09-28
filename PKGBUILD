# Maintainer: Riccardo Berto <riccardobrt@gmail.com>

pkgbase=python-pyowm
pkgname=('python-pyowm')
_pkgname=pyowm
pkgver=2.7.1
pkgrel=2
pkgdesc="A Python wrapper around the OpenWeatherMap API"
arch=('any')
url="https://github.com/csparpa/pyowm"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/csparpa/pyowm/archive/$pkgver.tar.gz")
md5sums=('2628c6364530d54d39a09f607584c9b6')

package() {
depends=('python')

    cd $_pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1

    chmod -R a+r $pkgdir/usr/lib/python*/site-packages/*info/

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

