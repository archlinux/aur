# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tomas A. Schertel <tschertel@gmail.com>

pkgname=cherrytree
pkgver=0.38.8
pkgrel=1
pkgdesc='Hierarchical note taking application featuring rich text and syntax highlighting'
arch=('any')
url='https://www.giuspen.com/cherrytree/'
license=('GPL3')
depends=('pygtksourceview2' 'python2-dbus')
optdepends=('python2-pyenchant: for spell checking support'
            'p7zip: for password protection support')
source=(https://www.giuspen.com/software/$pkgname-$pkgver.tar.xz)
sha256sums=('af21e540fddb3c5a92cdad9b4bbfc6ccd3ce3ab87076a2a01d2e3f2d683f48db')

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
