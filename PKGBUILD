# Maintainer: Alexander Fasching <fasching.a91@gmail.com>

pkgname=python-aioconsole
_pkgname=${pkgname#python-}
pkgver=0.1.16
pkgrel=1
pkgdesc="Asynchronous console and interfaces for asyncio"
arch=('any')
url="https://github.com/vxgmichel/aioconsole"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/vxgmichel/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('a275f656f6aa144da6506a43fb72aa45')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# vim:set sw=2 et:
