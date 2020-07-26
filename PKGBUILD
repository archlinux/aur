# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Clint Valentine <valentine dot clint at gmail dot com>

_name=gtfparse
pkgname='python-gtfparse'
pkgver=1.2.0
pkgrel=3
pkgdesc="Python library for parsing GTF files"
arch=('any')
url="https://pypi.python.org/pypi/gtfparse"
license=('Apache')
makedepends=('python' 'python-setuptools' 'python-pypandoc')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/g/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2f27aa2b87eb43d613edabf27f9c11147dc595c8683b440ac1d88e9acdb85873')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
