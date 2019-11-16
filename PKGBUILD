# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-wstool'
pkgname=('python-wstool')
_module='wstool'
pkgver='0.1.17'
pkgrel=2
pkgdesc="workspace multi-SCM commands"
url="http://wiki.ros.org/wstool"
depends=('python' 'python-vcstools' 'python-yaml')
conflicts=('python2-wstool')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c79b4f110ef17004c24972d742d2c5f606b0f6b424295e7ed029a48e857de237')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
