# Maintainer: kwrazi <gmail.com>

pkgname=python-zlmdb
_pkgname=zlmdb
pkgver=21.2.1
pkgrel=2
pkgdesc="Object-relational zero-copy in-memory database layer for LMDB."
arch=('any')
url="https://github.com/crossbario/zlmdb"
license=('MIT')
makedepends=('python-setuptools'
             'python-pip')
depends=('python>=3.7'
         'python-cbor2'
         'python-txaio'
         'python-lmdb'
         'python-yaml')
source=($pkgname-$pkgver.tar.gz::https://github.com/crossbario/zlmdb/archive/v${pkgver}.tar.gz)
sha1sums=('e8896d186b64f14de4ec42f820a62fb7252b1cf8')

package(){
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --prefix=/usr
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
