# Contributor: Adria Arrufat <swiftscythe@gmail.com>
pkgname=baires
pkgver=1.2r1
pkgrel=2
pkgdesc="A small tool to resize all images in a directory. It is designed to resize many images in quickest and simplest way possible."
arch=('i686' 'x86_64')
url="http://www.beli.ws/apps/baires/"
license=("GPL")
depends=('qt4')
source=("http://www.beli.ws/apps/baires/baires.tar.gz")


build() {
  cd $pkgname
  qmake
  make || return 1
  install -D -m755 baires $pkgdir/usr/bin/baires || return 1
  install -Dm644 baires.desktop $pkgdir/usr/share/applications/Baires.desktop
  install -Dm644  icons/baires-256.png $pkgdir/usr/share/pixmaps/baires.png
}

md5sums=('2ef963760336f595c071efb61813bfaf')
