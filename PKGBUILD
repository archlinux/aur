# Maintainer: anon at sansorgan.es 
# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tomas A. Schertel <tschertel@gmail.com>

pkgname=cherrytree
pkgver=0.39.2
pkgrel=1
pkgdesc='Hierarchical note taking application featuring rich text and syntax highlighting'
arch=('any')
url='https://www.giuspen.com/cherrytree/'
license=('GPL3')
depends=('python2-gtksourceview2' 'python2-dbus')
optdepends=('python2-pyenchant: for spell checking support'
            'p7zip: for password protection support'
	    'enchant-hspell: spell checking')
source=(https://www.giuspen.com/software/$pkgname-$pkgver.tar.xz)
sha256sums=('99b9a78beaf3749299df41fa1d2cf85e382a23c904d9ac3023b71326a63a5846')

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
