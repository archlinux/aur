# Maintainer: Brad Ackerman <brad[at]facefault[dot]org>
pkgbase=python-msoffcrypto-tool
pkgname=python-msoffcrypto-tool
_pyname=msoffcrypto-tool
pkgver=4.10.2
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
sha256sums=('beda602d97ca2913a1da697f840290b2dfdf0ee1d60bc230468df1e7de41da98')

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
