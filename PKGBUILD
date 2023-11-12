# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-mozjpeg-lossless-optimization'
pkgname=('python-mozjpeg-lossless-optimization')
_module='mozjpeg-lossless-optimization'
pkgver='1.1.3'
pkgrel=1
pkgdesc="Optimize JPEGs losslessly using MozJPEG"
url="https://github.com/wanadev/mozjpeg-lossless-optimization"
depends=('python>=3')
makedepends=('python-setuptools' 'cmake' 'python-setuptools' 'python-pip' 'gcc')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('725d98772e943fca18b0801cb94e645c477ff52e56ad0b27bddb76ddf091ca3e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
