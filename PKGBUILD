# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-mozjpeg-lossless-optimization'
pkgname=('python-mozjpeg-lossless-optimization')
_module='mozjpeg-lossless-optimization'
pkgver='1.1.2'
pkgrel=1
pkgdesc="Optimize JPEGs losslessly using MozJPEG"
url="https://github.com/wanadev/mozjpeg-lossless-optimization"
depends=('python>=3')
makedepends=('python-setuptools' 'cmake' 'python-setuptools' 'python-pip' 'gcc')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('0dd6cce9228e04e82692c04125974954ea184f3f7b7d4d90ff13055d12da06f7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
