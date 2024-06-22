# Maintainer: Kyle Manna <kyle at kyle manna dot com>

pkgname='bmaptool'
replaces=('bmap-tools')
pkgver=3.8.0
pkgrel=1
pkgdesc="Tool optimized for copying largely sparse files using information from a block map (bmap) file"
arch=('any')
url='https://github.com/yoctoproject/bmaptool'
license=('GPL2')
depends=('python' 'python-setuptools' 'python-six')
source=("https://github.com/yoctoproject/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3c741ccdd5049b5cb6983bc186f7be8040a132ed7e9c2afda4d9e7390888163c')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 docs/man1/bmaptool.1 "$pkgdir"/usr/share/man/man1/bmaptool.1
}

# vim:set ts=2 sw=2 et:
