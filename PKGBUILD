# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-bugsnag
pkgver=3.6.1
pkgrel=1
pkgdesc='Official bugsnag error monitoring and error reporting for various python apps.'
arch=('any')
url='https://www.bugsnag.com/platforms/python-error-reporting'
license=('MIT')
source=("https://github.com/bugsnag/bugsnag-python/archive/v${pkgver}.tar.gz")
makedepends=('git' 'python-setuptools')
depends=(
    'python'
    'python-webob'
    'python-six>=1.9'
    'python-six<2')
optdepends=(
    'python-flask: Flask integration'
    'python-blinker: Flask integration')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('c1cd9972a0987d50356b539a9941bd0d')
