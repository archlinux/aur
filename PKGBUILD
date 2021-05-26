# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=outwiker
pkgver=3.0.0.888
pkgrel=1
pkgdesc='Outliner and personal wiki with keeping the tree of notes in the form of directories on a disk'
arch=('any')
url='https://jenyay.net/Outwiker/English'
license=('GPL3')
depends=('python-cyhunspell' 'python-idna' 'python-pillow' 'python-pyparsing' 'python-wxpython')
makedepends=('python-setuptools')
source=("https://github.com/Jenyay/$pkgname/archive/stable_$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5ac7b6654bef38bf57e98daddfd001e203020db96f97844eb0dfec3f2d7421ec')

build() {
  cd $pkgname-stable_$pkgver
  python setup.py build
}

package() {
  cd $pkgname-stable_$pkgver 
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  make DESTDIR="$pkgdir" install
}
