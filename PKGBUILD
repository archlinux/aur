# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=zfec
pkgname=python-zfec
pkgver=1.5.7.2
pkgrel=1
pkgdesc="A fast erasure codec which can be used with the command-line, C, Python, or Haskell"
arch=('any')
url='https://pypi.python.org/pypi/zfec'
license=('GPL')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/z/zfec/zfec-${pkgver}.tar.gz")
sha256sums=('4ee519be0dcc7da2e88482bcfc0bf977a425e1d7e8278cf5bbbb8d00f8a2afb6')

build() {
    cd "zfec-$pkgver"
    python -m build --wheel --no-isolation
}

package_python-zfec() {
    cd "zfec-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
