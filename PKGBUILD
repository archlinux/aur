 
# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=epour
pkgver=0.7.0
pkgrel=1
pkgdesc="Torrent client based on EFL"
arch=('any')
url="https://phab.enlightenment.org/w/projects/epour/"
license=('GPL3')
depends=('python-efl' 'python-xdg' 'libtorrent-rasterbar>1.1.0' 'hicolor-icon-theme')
makedepends=('python-distutils-extra')
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.xz")
sha1sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="${pkgdir}"  #--optimize=1 if this active epour doesn't show icons

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS README COPYING
}
