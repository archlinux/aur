# Maintainer: Drew DeVault <sir@cmpwn.com>

pkgname='python-sshpubkeys'
pkgver=2.2.0
pkgrel=1
pkgdesc='Decodes various OpenSSH public key formats'
arch=('any')
url='https://pypi.python.org/pypi/sshpubkeys/1.0.5'
license=('BSD')
depends=('python-ecdsa' 'python-pycrypto')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/ojarva/python-sshpubkeys/archive/v${pkgver}.tar.gz"
)
md5sums=('f318fdda43a3081d52066ddcdc84c216')

build() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  python ./setup.py build

}

package() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
