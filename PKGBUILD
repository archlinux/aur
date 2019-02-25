# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=python-sshpubkeys
_pkgname=sshpubkeys
pkgver=3.1.0
pkgrel=1
pkgdesc='Decodes various OpenSSH public key formats'
arch=('any')
url='https://pypi.python.org/pypi/sshpubkeys/1.0.5'
license=('BSD')
depends=('python-ecdsa' 'python-crypto')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b388399caeeccdc145f06fd0d2665eeecc545385c60b55c282a15a022215af80')

build() {
    cd "$_pkgname-$pkgver"
    python ./setup.py build
}

check() {
    cd "$_pkgname-$pkgver"
    python ./setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
