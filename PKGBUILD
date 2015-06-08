# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kio_rar
pkgver=0.6
pkgrel=8
pkgdesc="A kioslave for RAR archives"
url="http://kde-apps.org/content/show.php?content=17527"
depends=('kdebase' 'unrar')
source=(http://kde-apps.org/CONTENT/content-files/17527-$pkgname-$pkgver.tar.bz2)
md5sums=('670c4a3cce504be4224e35de3d996148')
arch=( 'i686' 'x86_64')
license=("GPL")

package() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/opt/kde/share/mimelnk/application/x-rar-compressed.desktop
  rm "$pkgdir"/opt/kde/share/mimelnk/application/x-rar.desktop
}
