# Maintainer: detiam <dehe_tian at outlook dot com>

pkgname=python-gdbmi
_module='pygdbmi'
pkgver=0.11.0.0
pkgrel=1
pkgdesc="Parse gdb machine interface output with Python"
url="https://github.com/cs01/pygdbmi"
depends=('python')
provides=('python-pygdbmi')
conflicts=('python-pygdbmi')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/p/pygdbmi/pygdbmi-${pkgver}.tar.gz")
#source=("${pkgname}-${pkgver}.zip::https://codeload.github.com/cs01/pygdbmi/zip/refs/tags/v${pkgver}")
sha256sums=('7a286be2fcf25650d9f66e11adc46e972cf078a466864a700cd44739ad261fb0')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    rm -rf tests
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
