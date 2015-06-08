# Maintainer: Max Bruckner
pkgname=easyhg
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple user interface for the Mercurial distributed version contol system."
arch=('i686' 'x86_64')
url="http://easyhg.org"
license=('GPL2')
depends=('qt4' 'mercurial')
optdepends=('pyqt: authentication extension'
'python-crypto: password store'
'kdiff3: external diff/merge tool')
source=(https://code.soundsoftware.ac.uk/attachments/download/639/EasyMercurial-1.3.0-src.tar.gz)
md5sums=('728858917b2b121e2ee7ce160ff4151f')

build() {
  cd "$srcdir/EasyMercurial-1.3.0-src"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/EasyMercurial-1.3.0-src"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  cp EasyMercurial "$pkgdir/usr/bin/easyhg"
}
