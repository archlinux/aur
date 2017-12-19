# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pyvcf-git'
pkgver=v0.5.0.r266.g476169c
pkgrel=1
pkgdesc="A Variant Call Format reader for Python."
arch=('any')
url="https://github.com/jamescasbon/PyVCF"
license=('BSD')
depends=('python')
makedepends=('cython' 'python-setuptools')
provides=('python-pyvcf')
conflicts=('python-pyvcf')
options=(!emptydirs)
source=("git+https://github.com/jamescasbon/PyVCF.git")
md5sums=('SKIP')

pkgver() {
  cd "PyVCF"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/PyVCF"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
