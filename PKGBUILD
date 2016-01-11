pkgname=python-pylirc
pkgver=0.0.5
pkgrel=1
pkgdesc="Python module to interact with remote controls via lirc."
arch=('any')
url="http://sourceforge.net/projects/pylirc/"
license=('LGPLv2')
depends=('python' 'lirc')
source=("http://downloads.sourceforge.net/project/pylirc/pylirc/${pkgver}/pylirc-${pkgver}.tar.gz"
        "0001-Python3-patch.patch")
sha256sums=("a78315e1ddf5af61cf91000a4b2f8e2df0841edd97b2596b2e0c5505bf8330a2"
            "45096c38b2696c94c3c5550e4f4db67ab0e13a119a4938b76d7c138ebc3314e0")

prepare() {
  cd "${srcdir}/pylirc-${pkgver}"
  patch -p1 -i "${srcdir}/"0001-Python3-patch.patch
}

package() {
  cd "${srcdir}/pylirc-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

