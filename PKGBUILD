# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-mozjpeg-lossless-optimization'
pkgname=('python-mozjpeg-lossless-optimization')
_module='mozjpeg-lossless-optimization'
pkgver='1.0.0'
pkgrel=1
pkgdesc="Optimize JPEGs losslessly using MozJPEG"
url="https://github.com/wanadev/mozjpeg-lossless-optimization"
depends=('python>=3')
makedepends=('python-setuptools' 'cmake' 'python-setuptools' 'python-pip' 'gcc')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('11707d0ebf2fb1403c21d04cb239778ce901cf1be860366ef792b901ebb22eed')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
