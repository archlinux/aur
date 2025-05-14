# Maintainer: Peter Züger <zueger.peter@icloud.com>

_name=mpy-repl-tool
pkgname=mpy-repl-tool
pkgver=0.14
pkgrel=1
pkgdesc="Communicate and transfer files from and to MicroyPython boards via REPL"
arch=('any')
url="https://github.com/zsquareplusc/${_name}"
license=('custom')
makedepends=('python-setuptools')
depends=('python-pyserial' 'python-colorama')
optdepends=('python-fusepy: for mounting the micropython filesystem')
source=("https://files.pythonhosted.org/packages/b4/26/b99dc586ef4e6fa598d0c71e3f3e9ca9e307423dc082a39a06149fe55585/${_name}-${pkgver}.tar.gz")
sha256sums=('58c06ae6f1686dda1b3948c4564ac6df6228f74da7838303a03a5243cec8b909')


build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
