# Maintainer: Sebastian Lau <lauseb644@gmail.com>

pkgbase='python-omr'
pkgname=('python-omr')
_module='omr'
pkgver='0.0.73'
pkgrel=1
pkgdesc="Extract answer choices from scanned jpg"
url="http://github.com/GregoryCMiller/omr"
depends=('python' 'python-atomicwrites' 'python-attrs' 'python-importlib-metadata' 'python-more-itertools' 'python-opencv' 'python-numpy' 'python-packaging' 'python-pluggy' 'python-py' 'python-pyparsing' 'python-pytest' 'python-six' 'python-wcwidth' 'python-zipp')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('8feca62c1ceab22aeebe74533960f51d32813943195ba0f05dc73f1e3231374f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
