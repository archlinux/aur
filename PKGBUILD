# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=rox-thumbnailers
pkgver=1.0
pkgrel=1
pkgdesc="ROX-thumbnailers generate thumbnails for ROX-Filer using various thumbnailers."
arch=(i686 x86_64)
url="http://yurib.gitlab.io/"
license=('GPL')
groups=(rox)
depends=(rox rox-lib)
makedepends=(python2)
optdepends=(
  'ffmpegthumbnailer: for video thumbnails using ffmpeg'
  'totem: for video thumbnails using GStreamer'
  'totem-xine: for video thumbnails using Xine'
  'evince: for PDF/PS/DVI documents'
  'raw-thumbnailer: for raw images'
  'comix: for comic book archives'
  'thunar-thumbnailers: for TeX, Grace and OpenDocument thumbnails'
)
# Nonexistent ArchLinux packages:
#  gnome-nds-thumbnailer
#  swfdec-thumbnailer
#  gnome-xcf-thumbnailer
#install=rox-thumbnailers.install
source=(https://sites.google.com/site/yuribongiorno/ROX-thumbnailers_${pkgver}.0.tgz)
md5sums=('c53e7eb42e54fc8a0673dbf78456d441')

build() {
  cd "$srcdir/ROX-thumbnailers"

  python2 -m compileall .
  python2 -O -m compileall .
}

package() {
  cd "$srcdir/ROX-thumbnailers"

  mkdir -p $pkgdir/usr/share/apps
  cp -R $srcdir/ROX-thumbnailers $pkgdir/usr/share/apps
}

# vim:set ts=2 sw=2 et:
