# Maintainer: Max Bruckner
pkgname=easyhg
pkgver=1.3.0
pkgrel=2
pkgdesc="Simple user interface for the Mercurial distributed version contol system."
arch=('i686' 'x86_64')
url="http://easyhg.org"
license=('GPL2')
depends=('qt4' 'mercurial')
optdepends=('pyqt: authentication extension'
'python-crypto: password store'
'kdiff3: external diff/merge tool')
source=("https://code.soundsoftware.ac.uk/attachments/download/639/EasyMercurial-$pkgver-src.tar.gz"
    easyhg.desktop
)
md5sums=('728858917b2b121e2ee7ce160ff4151f'
         'd4362bd25f61606a67bbe27bbfacbeeb')

build() {
  cd "$srcdir/EasyMercurial-$pkgver-src"
  qmake-qt4
  make
}

package() {
  install -Dm 755 "$srcdir/EasyMercurial-$pkgver-src/EasyMercurial" "$pkgdir/usr/bin/easyhg"
  install -Dm 644 "$srcdir/EasyMercurial-$pkgver-src/images/icon/scalable/easyhg-icon.svg" "$pkgdir/usr/share/pixmaps/easyhg.svg"
  install -Dm 644 "$srcdir/easyhg.desktop" "$pkgdir/usr/share/applications/easyhg.desktop"
}
