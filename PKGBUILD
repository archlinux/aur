# Contributor: Vjacheslav Gaevskih <feanor1397@gmail.com>

pkgname=gspectran
pkgver=0.1
pkgrel=1
pkgdesc="Gtk+ audio visualizer for pulseaudio."
arch=('x86_64' 'i686')
url='https://github.com/Feanor1397/gspectran'
license=('GPLv3')
depends=('libpulse'
         'fftw'
         'cairomm'
         'gtkmm3'
         )
makedepends=('cmake')
conflicts=('gspectran')
provides=('gspectran')
source=("https://github.com/Feanor1397/gspectran/archive/${pkgver}.tar.gz")
sha256sums=('34bc7f1a387114a00c19e17038c8db819cd898f369d8941ea91907d3a436e004')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
