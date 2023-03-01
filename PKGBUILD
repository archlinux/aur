# Maintainer: Heavysink <winstonwu91@gmail.com>
pkgname=python-wrf
_pkgname='wrf-python'
pkgver=1.3.4.1
pkgrel=1
pkgdesc="A collection of diagnostic and interpolation routines for use with output from the Weather Research and Forecasting (WRF-ARW) Model."
url="https://wrf-python.readthedocs.io/en/latest/"
depends=('python' 'python-numpy')
makedepends=('python-setuptools' 'python-pip' 'gcc-fortran')
provides=('wrf-python')
conflicts=('wrf-python')
license=('APACHE')
arch=('x86_64')
source=("https://github.com/NCAR/wrf-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('334aa79ce3c608ca064c55491f249dd7c039ab22e20324a9e16d9ea015ce1fae')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
