# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nicolas Haigh <haigh.nicolas at googlemail dot com>
pkgname=python-owm
pkgver=2.4.0
pkgrel=1
pkgdesc="python library that wraps around the OpenWeatherMap API"
arch=('any')
url="https://github.com/csparpa/pyowm"
license=('MIT')
depends=('python>=3.2')
makedepends=("python-setuptools")
options=("strip")
source=("https://github.com/csparpa/pyowm/archive/$pkgver.tar.gz")
md5sums=(SKIP)

prepare() {
	cd "pyowm-$pkgver"
}

build() {
	cd "pyowm-$pkgver"
    python setup.py build
}

package() {
	cd "pyowm-$pkgver"
    python setup.py install --root="$pkgdir"
    install -D -m644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
