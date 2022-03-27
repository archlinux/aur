# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-keyfile'
_pkgname=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc="A library for handling the encrypted keyfiles used to store ethereum private keys"
arch=('any')
depends=()
makedepends=('python-setuptools' 'python-pypandoc')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d30597cdecb8ccd3b56bb275cd86fcdc7a279f86eafa92ddc49f66512f0bff67')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
