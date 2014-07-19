# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=epour
pkgver=0.6.0
pkgrel=2
pkgdesc="Torrent client based on EFL"
arch=('any')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('python2-efl' 'python2-xdg' 'libtorrent-rasterbar' 'hicolor-icon-theme')
makedepends=('python2-distutils-extra')
install=$pkgname.install
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.xz")
sha1sums=('7cfa8bbaf01bd6106ead24391a5deea23996e29a')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS README
}
