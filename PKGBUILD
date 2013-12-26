# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=epour
pkgver=0.5.2.0
pkgrel=2
pkgdesc="Torrent client based on EFL"
arch=('any')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('python2-efl' 'libtorrent' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'python2-distutils-extra')
install=$pkgname.install
source=("git://git.enlightenment.org/apps/$pkgname.git#tag=epour-$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"

  sed -i 's/env python$/&2/' bin/epour \
                             epour/*.py \
                             epour/gui/*.py
}

package() {
  cd "$srcdir/$pkgname"

  python2 setup.py install --root="$pkgdir"

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
