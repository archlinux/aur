# Maintainer: Médéric Boquien <mboquien@free.fr>
# Contributor: Astro Benzene <universebenzene at sina dot com>

pkgname=python-pyregion
pkgver=2.1.1
pkgrel=3
pkgdesc="A python module to parse ds9 and ciao region files"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pyregion"
license=("MIT")
depends=('python' 'python-astropy>=1.0' 'python-pyparsing>=2.0' 'cython')
optdepends=('python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/p/pyregion/pyregion-${pkgver}.tar.gz")
sha512sums=('ae62218f3059c46bda2d168843004025a39af6f335be5ffb618a9eecfa27430eba185d619e988bfdb95bdddf84f4de07a45bd83e641a1f2792e36c039d165a58')

build() {
  cd ${srcdir}/pyregion-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/pyregion-${pkgver}

  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
  python setup.py install --root=${pkgdir}  --prefix=/usr --optimize=1 --use-system-libraries --offline
}
