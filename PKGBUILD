# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=kpdftool
pkgver=0.23
pkgrel=2
pkgdesc="GUI interface for GhostView and ImageMagick for operations with PDF and PostScript"
arch=('i686' 'x86_64')
url='http://kde-apps.org/content/show.php/KPDFTool?content=33194'
license=('GPL3')
depends=('qt4')
source=("http://kde-apps.org/CONTENT/content-files/33194-${pkgname}-${pkgver}-Qt4.zip")
md5sums=('243a6fe1da8e942d6e1ab2bc76ec4536')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  qmake-qt4
  make 
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
} 
 
