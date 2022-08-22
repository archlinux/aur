# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-hexbytes'
_pkgname=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="Python bytes subclass that decodes hex, with a readable console output"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('afeebfb800f5f15a3ca5bab52e49eabcb4b6dac06ec8ff01a94fdb890c6c0712')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
