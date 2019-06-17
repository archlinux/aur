# Maintainer: Brad Ackerman <brad[at]facefault[dot]org>
pkgbase=python-msoffcrypto-tool
pkgname=python-msoffcrypto-tool
_pyname=msoffcrypto-tool
pkgver=4.10.0
pkgrel=1
pkgdesc=''
arch=('any')
url='https://github.com/nolze/msoffcrypto-tool'
license=('MIT')
depends=('python-olefile' 'python-cryptography')
makedepends=('python' 'python-setuptools')
checkdepends=('python-nose' 'python-coverage')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('66a38297308cbf6085b5ae612c48a5d0244ec04b4335164e25db43e3fb4df6d9')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
}

check() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py test
}

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  # install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}
