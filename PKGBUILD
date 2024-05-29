# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gicu Gorodenco <cyclopsihus@gmail.com>
pkgname=qpitch
pkgver=1.0.1
pkgrel=5
_commit=f0e2fb15e7a56fe1c3bb6d346003ca8997a5bf74
pkgdesc="instrument tuner"
arch=('i686' 'x86_64')
url="https://github.com/sandsmark/qpitch/"
license=('GPL-2.0-or-later')
depends=(qt6-base portaudio fftw hicolor-icon-theme glibc gcc-libs)
makedepends=('cmake')
source=(https://github.com/sandsmark/qpitch/archive/$_commit.zip qpitch_logo.xpm qpitch.desktop)
md5sums=('6242373b07a481295cb98e31e17105dc' '8a3cadc0c9c98f1213670d1316e945e5' '9068aafb48ff21a6ac6990012abbef5d')

build() {
  cd ${srcdir}/${pkgname}-${_commit}/
  cmake .
  make
}

package() {
  install -D -m 755 ${srcdir}/${pkgname}-${_commit}/qpitch ${pkgdir}/usr/bin/qpitch
  install -D -m 644 ${srcdir}/qpitch_logo.xpm ${pkgdir}/usr/share/icons/hicolor/32x32/apps/qpitch_logo.xpm
  install -D -m 644 ${srcdir}/qpitch.desktop ${pkgdir}/usr/share/applications/qpitch.desktop
}
