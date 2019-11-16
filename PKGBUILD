# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-wstool'
pkgname=('python2-wstool')
_module='wstool'
pkgver='0.1.17'
pkgrel=2
pkgdesc="workspace multi-SCM commands"
url="http://wiki.ros.org/wstool"
depends=('python2' 'python2-vcstools' 'python2-yaml')
conflicts=('python-wstool')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c79b4f110ef17004c24972d742d2c5f606b0f6b424295e7ed029a48e857de237')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
