# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=python-oscrypto
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc='TLS (SSL) sockets, key generation, encryption, decryption, signing, verification and KDFs using the OS crypto libraries.'
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python' 'python-asn1crypto')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2f53f50813ecc5114fd126b89766fabdb9448e0bb080814451cc4bb92acafca4')

build() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
