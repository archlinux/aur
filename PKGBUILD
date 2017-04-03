# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname='python-sshpubkeys'
pkgver=2.2.0
pkgrel=3
pkgdesc='Decodes various OpenSSH public key formats'
arch=('any')
url='https://pypi.python.org/pypi/sshpubkeys/1.0.5'
license=('BSD')
depends=('python-ecdsa' 'python-crypto')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/ojarva/python-sshpubkeys/archive/v${pkgver}.tar.gz"
)
sha256sums=('025a4841190cb265dd3c9a18fd3728195d8f1730566bbfe92e7fcdde66122a09')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python ./setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
