# Maintainer: Médéric Boquien <mboquien@free.fr>
# Contributor: Astro Benzene <universebenzene at sina dot com>

pkgname=python-pyregion
pkgver=2.2.0
pkgrel=1
pkgdesc="A python module to parse ds9 and ciao region files"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pyregion"
license=("MIT")
depends=('python>=3.7' 'python-astropy>=4.0' 'python-pyparsing>=2.0' 'python-numpy>=1.16' 'cython')
optdepends=('python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/p/pyregion/pyregion-${pkgver}.tar.gz")
sha512sums=('707ca08bb2bdd3afdb2cc42ade19ff46dca4b8f4824cfe5ac76704de50a15bf7c98b90cd6b28fd9c7ee6ba4219494109f2d329966b307bda074f144ef1aaa78d')

build() {
  cd ${srcdir}/pyregion-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/pyregion-${pkgver}

  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
  python setup.py install --root=${pkgdir}  --prefix=/usr --optimize=1
}
