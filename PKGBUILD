# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-bugsnag
pkgver=4.1.0
pkgrel=1
pkgdesc='Official bugsnag error monitoring and error reporting for various python apps.'
arch=('any')
url='https://www.bugsnag.com/platforms/python-error-reporting'
license=('MIT')
depends=('python'
         'python-webob'
         'python-six>=1.9'
         'python-six<2')
makedepends=('python-setuptools')
optdepends=('python-flask: Flask integration'
            'python-blinker: Flask integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bugsnag/bugsnag-python/archive/v$pkgver.tar.gz")
sha256sums=('d05c58dd4aaacad262b2f38bf23c7b894548d25cd6a61691db0dbaf8733ac9bf')
validpgpkeys=('4AEE18F83AFDEB23')

build() {
	cd "bugsnag-python-${pkgver}"
	python setup.py build
}

package() {
	cd "bugsnag-python-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
