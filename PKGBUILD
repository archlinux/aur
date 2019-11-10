# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=zfec
pkgname=('python2-zfec' 'python-zfec')
pkgver=1.5.3
pkgrel=1
pkgdesc="A fast erasure codec which can be used with the command-line, C, Python, or Haskell"
arch=('any')
url='https://pypi.python.org/pypi/zfec'
license=('GPL')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/z/zfec/zfec-${pkgver}.tar.gz")
sha256sums=('b41bd4b0af9c6b3a78bd6734e1e4511475944164375e6241b53df518a366922b')

package_python2-zfec() {
    depends=('python2-pyutil' 'python2-argparse')
    replaces=('zfec')
    conflicts=('python-zfec')

    cd "zfec-$pkgver"
    python2 setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1
}

package_python-zfec() {
    depends=('python-pyutil' 'python-argparse')
    conflicts=('python2-zfec')

    cd "zfec-$pkgver"
    python setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1
}
