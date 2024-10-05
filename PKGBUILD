# Maintainer: Médéric Boquien <mboquien@free.fr>
# Contributor: Astro Benzene <universebenzene at sina dot com>

pkgname=python-pyregion
pkgver=2.3.0
pkgrel=2
pkgdesc="A python module to parse ds9 and ciao region files"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pyregion"
license=("MIT")
depends=('python>=3.10' 'python-astropy>=5.0' 'python-pyparsing>=2.0' 'python-numpy>=2.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'cython>=3.0' 'python-setuptools' 'python-setuptools-scm>=6.2' 'python-extension-helpers')
optdepends=('python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/p/pyregion/pyregion-${pkgver}.tar.gz")
sha512sums=('7722709eb02eccc64134750098d6261b26bae936af378f9c18470c29a4f6bd865c9e453c7a5cb2102e86619addd8ae71ce05d7e8ca7219642b7bc9b449a2851d')

build() {
  cd ${srcdir}/pyregion-${pkgver}

  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/pyregion-${pkgver}

  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
  python -m installer --destdir="$pkgdir" dist/*.whl
}
