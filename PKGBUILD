# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=epour
pkgver=0.6.0
pkgrel=1
pkgdesc="Torrent client based on EFL"
arch=('any')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('python2-efl' 'python2-xdg' 'libtorrent' 'hicolor-icon-theme')
makedepends=('git' 'python2-distutils-extra')
install=$pkgname.install
source=("git://git.enlightenment.org/apps/$pkgname.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  python2 setup.py install --root="$pkgdir" --optimize=1

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS README
}
