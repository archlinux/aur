# Maintainer: Jose Riha <jose1711 at gmail dot com>

pkgname=ihu-git
_pkgname=ihu
pkgver=r7.3587923
pkgrel=2
pkgdesc='I Hear U VoIP application that creates an audio stream between two computers'
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/jose1711/ihu"
license=('GPL-2')
depends=('qt4' 'speex' 'soundtouch' 'jack2')
provides=('ihu')
conflicts=('ihu')
source=("git://github.com/jose1711/ihu.git")

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}
