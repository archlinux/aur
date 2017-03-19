# Contributor: Vjacheslav Gaevskih <feanor1397@gmail.com>

pkgname=gspectran
pkgver=0.1.0.alpha
pkgrel=1
pkgdesc="Gtk+ audio visualizer for pulseaudio."
arch=('x86_64' 'i686')
url='https://github.com/Feanor1397/gspectran'
license=('GPLv3')
depends=('libpulse'
         'fftw'
         'cairo'
         )
makedepends=('cmake')
conflicts=('gspectran')
provides=('gspectran')
source=("https://github.com/Feanor1397/gspectran/archive/${pkgver}.tar.gz")
sha256sums=('c520269f2fa12ebd83fd4a7ff212077b931b6645f419845d94da90908c52713c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
