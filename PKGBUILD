# Maintainer:

pkgname=cinelerra-hv
pkgver=7.2
pkgrel=1
pkgdesc="Professional video editing and compositing environment"
arch=(x86_64)
url="https://cinelerra.org/"
license=(GPL2)
depends=(libpng
)
makedepends=(alsa-lib atk bzip2 cairo expat fftw flac
             fontconfig freetype2 fribidi gdk-pixbuf2
             glu graphite gtk2 harfbuzz libavc1394
             libdatrie libdv libffi libglvnd libiec61883 libjpeg-turbo
             libogg libraw1394 libsndfile libthai libusb
             libtheora libtiff libutil-linux libvdpau libva libvorbis
             libvpx libx11 libxau libxcb libxcomposite libxcursor
             libxdamage libxdmcp libxext libxfixes libxft libxi
             libxinerama libxrandr libxrender libxv numactl opus
             pango pcre pixman xorg-server
             ttf-dejavu

             yasm  cmake libtool
        	 libxml2 perl-xml-libxml perl-xml-parser
        	 xorg-mkfontdir xorg-mkfontscale
)
source=("$pkgname-$pkgver-src.tar.xz::https://sourceforge.net/projects/heroines/files/cinelerra-$pkgver-src.tar.xz")
sha256sums=('f1190edaa1c8cb863f971a0f14b61fa4cb76056262e67386f071b2d330ff2797')

build() {
  cd "${srcdir}/cinelerra-$pkgver"
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "${srcdir}/cinelerra-$pkgver"
  make -j1 DESTDIR="${pkgdir}" install
}
