# Contributor: noonov <noonov@gmail.com>

pkgname=jd
pkgver=2.8.9
_date=150226
pkgrel=1
pkgdesc="A 2channel browser written in C++ using gtkmm"
arch=('i686' 'x86_64')
url="http://jd4linux.sourceforge.jp/"
license=('GPL2')
depends=('gnutls' 'libsm' 'gtkmm')
conflicts=('jd-svn')
source=(http://dl.sourceforge.jp/jd4linux/62877/${pkgname}-${pkgver}-${_date}.tgz)
md5sums=('8b9bae5fa50e5e381f4a1890d50b0b31')
sha256sums=('f011665d3b2ed6c3b41e28ee3029e511ea248faad142b1a32a89faf1dd5eeb7d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-${_date}

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-${_date}

  make DESTDIR=${pkgdir} install
}
