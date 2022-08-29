# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=zfec
pkgname=python-zfec
pkgver=1.5.5
pkgrel=1
pkgdesc="A fast erasure codec which can be used with the command-line, C, Python, or Haskell"
arch=('any')
url='https://pypi.python.org/pypi/zfec'
license=('GPL')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/z/zfec/zfec-${pkgver}.tar.gz")
sha256sums=('6033b2f3cc3edacf3f7eeed5f258c1ebf8a1d7e5e35b623db352512ce564e5ca')

build() {
    cd "zfec-$pkgver"
    python -m build --wheel --no-isolation
}

package_python-zfec() {
    cd "zfec-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
