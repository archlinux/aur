# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=pydna
pkgbase='python-pydna'
pkgname=('python-pydna')
pkgver=2.0.3
pkgrel=1
pkgdesc="Python3 classes for dsDNA simulation of homologous recombination, Gibson assembly and interactive cloning"
arch=('any')
url="https://pypi.python.org/pypi/pydna"
license=('GPL3')
makedepends=(
  'python' 'python-setuptools'
  # 'python2' 'python2-setuptools'
)
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".zip::https://pypi.python.org/packages/67/f2/552bd375666bb3e2ff4b3ec418ed2d5bbe1140847075d7c2d682435153c8/pydna-2.0.3.zip)
sha256sums=('64b49daf4e30c53ac45a0bb5f40519fc627dd01c5751eae9d72a8f4a75a19e16')

# prepare() {
#   cp -a "${_name}"-"${pkgver}"{,-py2}
# }

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  # cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  # python2 setup.py build
}

package_python2-pydna() {
  depends=(
    'python2'
    'python2-appdirs'
    'python2-biopython'
    'python2-networkx'
    'python2-ordered-set'
    'python2-prettytable'
    'python2-pyparsing'
    'python2-requests'
  )
  optdepends=(
    'python2-matplotlib: gel simulation'
    'python2-mpldatacursor: gel simulation'
    'python2-numpy: gel simulation'
    'python2-pint: gel simulation'
    'python2-scipy: gel simulation'
  )

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-pydna() {
  depends=(
    'python'
    'python-appdirs'
    'python-biopython'
    'python-networkx'
    'python-ordered-set'
    'python-prettytable'
    'python-pyparsing'
    'python-requests'
  )
  optdepends=(
    'python-matplotlib: gel simulation'
    'python-mpldatacursor: gel simulation'
    'python-numpy: gel simulation'
    'python-pint: gel simulation'
    'python-scipy: gel simulation'
  )

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
