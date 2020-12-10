# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=mpy-repl-tool
_pkgname=mpy-repl-tool
pkgver=0.12
pkgrel=1
pkgdesc="Communicate and transfer files from and to MicroyPython boards via REPL"
arch=('any')
url="https://github.com/zsquareplusc/mpy-repl-tool"
license=('custom')
makedepends=('python-setuptools')
depends=(python-pyserial python-colorama)
optdepends=('python-fusepy: for mounting the micropython filesystem')
source=(https://files.pythonhosted.org/packages/36/a3/5799b2d57449b3247afb464ec9720ecfdbf1ecec763d6e31f430811e5456/${pkgname}-${pkgver}.tar.gz)
md5sums=('6000e36e66c63d352b86f447221393a4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
