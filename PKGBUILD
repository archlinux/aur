# Maintainer: Steve Ovens <steve_ovens [AT] linux DOT com>

pkgname=openconnect4x
pkgver=4.08
_srcdirname=openconnect-4.08
pkgrel=1
pkgdesc='Openconnect 4.x'
arch=('i686' 'x86_64')
license=(LGPL2.1)
url="http://www.infradead.org/openconnect/download.html"
depends=('vpnc' 'libproxy' 'libxml2')
source=("ftp://ftp.infradead.org/pub/openconnect/openconnect-4.08.tar.gz")
sha256sums=('114eef2b5a8087f26c7871db8700a293101e9626fc94fbef54ac6daef6ce1a77')

prepare() {
  cd "${_srcdirname}"
  sed -i "s/\[python\]/\[python2\]/g" configure.ac
}
build(){
  cd "${_srcdirname}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${_srcdirname}"
    make -k check
}

package() {
  cd "${_srcdirname}"

  make DESTDIR="${pkgdir}" install
}
