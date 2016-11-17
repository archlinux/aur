# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: kagan <juanynie AT gmail DOT com>

pkgname=kde-thumbnailer-blender
pkgver=0.3
pkgrel=2
pkgdesc="KDE plugin to show thumbnails of Blender files"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/?content=146380"
license=('GPL')
depends=('kdelibs' 'zlib')
makedepends=('cmake' 'automoc4')
source=("$pkgname-$pkgver.tar.gz::https://dl.opendesktop.org/api/files/download/id/1460971612/146380-kde-thumbnailer-blender_${pkgver}kayosiii.tar.gz")
sha256sums=('b2162c1ea09103b87b7f6ee69725e8de972a4781fd442c34fd4b3346de878319')

build() {
  cd $srcdir/$pkgname
  cmake -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package () {                                                                                   
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
