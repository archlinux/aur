# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
_pkgname=aioconsole
pkgname=python-aioconsole
pkgver=0.1.15
pkgrel=1
pkgdesc="Asynchronous console and interfaces for asyncio"
arch=('any')
url="https://github.com/vxgmichel/aioconsole"
license=('GPLv3')
depends=('python' 'python-setuptools')
_name=${pkgname#python-}
source=("https://github.com/vxgmichel/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('e5234a8dd84510a81eabfba145c46d05')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# vim:set sw=2 et:
