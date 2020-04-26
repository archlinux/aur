# Maintainer: Kirek <rbuldo at gmail dot com>
pkgname=python-langtable
_pyname=langtable
pkgver=0.0.51
pkgrel=1
pkgdesc='Guessing reasonable defaults for locale, keyboard layout, territory, and language.'
arch=('any')
url='https://github.com/mike-fabian/langtable'
license=('GPLv3+' 'MIT')
depends=('python' 'python-setuptools' 'gzip')
options=(!emptydirs)
source=("https://github.com/mike-fabian/${_pyname}/archive/${pkgver}.tar.gz")
sha256sums=('fc674af2664f54018359dbcb69b6d40dd5f2642ab2b77f653fbceaef84852ec2')

_destdir=/usr
  
build () {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py build
}
package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install --prefix="${_destdir}"  --root="${pkgdir}" --optimize=1 --skip-build
}
