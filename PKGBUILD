# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=mpy-repl-tool
_pkgname=mpy-repl-tool
pkgver=0.11
pkgrel=1
pkgdesc="Communicate and transfer files from and to MicroyPython boards via REPL"
arch=('any')
url="https://github.com/zsquareplusc/mpy-repl-tool"
license=('custom')
makedepends=('python-setuptools')
depends=(python-pyserial python-colorama)
optdepends=('python-fusepy: for mounting the micropython filesystem')
source=(https://files.pythonhosted.org/packages/14/05/5ff6656c6737da474d6a35a46959b4d8ef37471846f18e2dad2d3befa165/${pkgname}-${pkgver}.tar.gz)
md5sums=('a3ca4281da6b584a0bad07d9667234cd')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
