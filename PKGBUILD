# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=mpy-repl-tool
_pkgname=mpy-repl-tool
pkgver=0.13
pkgrel=1
pkgdesc="Communicate and transfer files from and to MicroyPython boards via REPL"
arch=('any')
url="https://github.com/zsquareplusc/mpy-repl-tool"
license=('custom')
makedepends=('python-setuptools')
depends=('python-pyserial' 'python-colorama')
optdepends=('python-fusepy: for mounting the micropython filesystem')
source=("https://files.pythonhosted.org/packages/44/6c/7b90f0db24cb83964dca4832af5c969722feff108c479fa8185a225d88e2/${pkgname}-${pkgver}.tar.gz")
sha256sums=('713bb1ed19a50ebbdfbce42b48f189f09394b02e9e1c46652633bd7c4b18d373')


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
