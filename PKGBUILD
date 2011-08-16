# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=obconf
pkgver=2.0.3git20100309
pkgrel=1
pkgdesc="A GTK2 based configuration tool for the Openbox windowmanager"
arch=('i686' 'x86_64')
url="http://openbox.org/wiki/ObConf:About"
license=('GPL')
depends=('openbox' 'gtk2' 'libglade' 'desktop-file-utils' 'libsm')
install=${pkgname}.install
source=("ftp://ftp.archlinux.org/other/community/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('122f2c46a2843175e4c3a27c3e6b8ed5')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
