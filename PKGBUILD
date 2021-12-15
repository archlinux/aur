# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Contributor: 'alerque' Caleb Maclennan <caleb@alerque.com>

pkgname=python-pytimeparse
_pkgname=${pkgname#python-}
pkgver=1.1.8
pkgrel=3
pkgdesc="A small Python library to parse various kinds of time expressions"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url='https://github.com/wroberts/pytimeparse'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e86136477be924d7e670646a98561957e8ca7308d44841e21f5ddea757556a0a')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.rst
}
