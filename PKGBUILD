# $Id: PKGBUILD 148812 2015-12-06 04:44:46Z foutrelis $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gstreamer0.10-mm
pkgver=0.10.11
pkgrel=3
pkgdesc="C++ interface for GStreamer 0.10"
arch=('i686' 'x86_64')
url="http://gstreamer.freedesktop.org/bindings/cplusplus.html"
license=('LGPL')
depends=('gstreamer0.10-base' 'libxml++2.6')
changelog=$pkgname.changelog
source=(http://ftp.gnome.org/pub/GNOME/sources/gstreamermm/0.10/gstreamermm-${pkgver}.tar.xz)
sha256sums=('12b5f377363594a69cb79f2f5cd0a8b1813ca6553680c3216e6354cfd682ebc6')

build() {
  cd "${srcdir}"/gstreamermm-${pkgver}

  # glibmm 2.46 uses C++11 features
  CXXFLAGS+=' -std=c++11'

  ./configure --prefix=/usr --disable-documentation
  make
}

package() {
  cd "${srcdir}"/gstreamermm-${pkgver}

  make DESTDIR="${pkgdir}" install
}
