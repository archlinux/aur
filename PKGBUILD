# Contributor: Vjacheslav Gaevskih <feanor1397@gmail.com>

pkgname=gspectran
pkgver=0.2
pkgrel=1
pkgdesc="Gtk+ audio visualizer for pulseaudio."
arch=('x86_64' 'i686')
url='https://github.com/Feanor1397/gspectran'
license=('GPLv3')
depends=('libpulse'
         'fftw'
         'cairomm'
         'gtkmm3'
         'boost-libs'
         )
makedepends=('cmake' 'pkg-config' 'boost')
conflicts=('gspectran')
provides=('gspectran')
source=("https://github.com/Feanor1397/gspectran/archive/${pkgver}.tar.gz")
sha256sums=('fe8d554d992f4ba489036ca5113fd57645daf6e291adb75cdeedb76b6666db39')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
