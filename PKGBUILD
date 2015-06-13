# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=audiothumbs
pkgver=0.2
pkgrel=4
pkgdesc="Plugin for KDE file managers (Dolphin and Konqueror) to preview cover arts embedded in audio (MP3, FLAC, OGG, M4A) files tags as thumbnails."
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/AudioThumbs?content=145088"
depends=('taglib' 'kdebase-dolphin')
makedepends=('cmake' 'automoc4' 'flac')
source=(http://kde-look.org/CONTENT/content-files/145088-AudioThumbs-${pkgver}.tar.gz)
sha1sums=('0bb42b0697fc51c0b95860d02ca81807f622db37')

build() {
  cd "${srcdir}/src"
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make
}

package() {
  cd "${srcdir}/src"
  make DESTDIR=${pkgdir} install
}
