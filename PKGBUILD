# $Id$
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=rox-thumbnailers
pkgver=1.0
pkgrel=1
pkgdesc="ROX-thumbnailers generate thumbnails for ROX-Filer using various thumbnailers."
arch=(i686 x86_64)
url="http://yuri.bongiorno.googlepages.com/"
license=('GPL')
groups=(rox)
depends=(rox rox-lib)
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
install=rox-thumbnailers.install
source=(http://denver.sociol.unimi.it/~yuri/rox/ROX-thumbnailers_${pkgver}.0.tgz)
md5sums=('c53e7eb42e54fc8a0673dbf78456d441')

build() {
  cd "$srcdir/ROX-thumbnailers"

  python -m compileall .
  python -O -m compileall .

  mkdir -p $pkgdir/usr/share/apps
  cp -R $srcdir/ROX-thumbnailers $pkgdir/usr/share/apps
}

# vim:set ts=2 sw=2 et:
