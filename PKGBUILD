# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=zfec
pkgname=('python2-zfec' 'python-zfec')
pkgver=1.5.5
pkgrel=1
pkgdesc="A fast erasure codec which can be used with the command-line, C, Python, or Haskell"
arch=('any')
url='https://pypi.python.org/pypi/zfec'
license=('GPL')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/z/zfec/zfec-${pkgver}.tar.gz")
sha256sums=('6033b2f3cc3edacf3f7eeed5f258c1ebf8a1d7e5e35b623db352512ce564e5ca')

package_python2-zfec() {
    depends=('python2-pyutil')
    replaces=('zfec')
    conflicts=('python-zfec')

    cd "zfec-$pkgver"
    python2 setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1
}

package_python-zfec() {
    depends=('python-pyutil')
    conflicts=('python2-zfec')

    cd "zfec-$pkgver"
    python setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1
}
