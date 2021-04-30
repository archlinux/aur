# Maintainer: Gabriel Flores <gabriel.flores.m at ug dot uchile dot cl>

pkgname=python-aed-utilities
pkgver=0.5.2
pkgrel=1
pkgdesc="AED es un paquete de Python que permite visualizar estructuras de datos."
arch=('any')
url='https://github.com/ivansipiran/aed-utilities'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-validators' 'python-beautifulsoup4' 'python-graphviz' 'python-ipykernel')
provides=('python-aed-utilities')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('463cd9e0ac25f870d2d36f01f01a5ba2')

build() {
    cd $srcdir/aed-utilities-$pkgver
    python -m setuptools.launch setup.py build
}

package() {
    cd $srcdir/aed-utilities-$pkgver
    python -m setuptools.launch setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
