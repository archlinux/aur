# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nicolas Haigh <haigh.nicolas at googlemail dot com>
pkgname=python2-owm
pkgver=2.5.0
pkgrel=1
pkgdesc="a wrapper for the OpenWeatherMap API"
arch=('any')
url="https://github.com/csparpa/pyowm"
license=('MIT')
depends=('python2>=2.7')
makedepends=("python2-setuptools")
options=("strip")
source=("https://github.com/csparpa/pyowm/archive/$pkgver.tar.gz")
md5sums=(SKIP)

prepare() {
	cd "pyowm-$pkgver"
}

build() {
	cd "pyowm-$pkgver"
    python2 setup.py build
}

package() {
	cd "pyowm-$pkgver"
    python2 setup.py install --root="$pkgdir"
    install -D -m644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
