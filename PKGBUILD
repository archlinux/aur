# Maintainer: Brad Ackerman <brad[at]facefault[dot]org>
pkgbase=python-msoffcrypto-tool
pkgname=python-msoffcrypto-tool
_pyname=msoffcrypto-tool
pkgver=4.11.0
pkgrel=1
pkgdesc='A Python tool and library for decrypting encrypted MS Office files.'
arch=('any')
url='https://github.com/nolze/msoffcrypto-tool'
license=('MIT')
depends=('python-olefile' 'python-cryptography')
makedepends=('python' 'python-setuptools')
checkdepends=('python-nose' 'python-coverage')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('56a1fe5e58ca417ca8756e8d7224ae599323996da65f81a35273c0f1e2eaf490')

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
