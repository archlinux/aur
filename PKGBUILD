# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-eth-keyfile'
_pkgname=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc="A library for handling the encrypted keyfiles used to store ethereum private keys"
arch=('any')
depends=()
makedepends=('python-pip' 'python-setuptools' 'python-pypandoc')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('939540efb503380bc30d926833e6a12b22c6750de80feef3720d79e5a79de47d')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
