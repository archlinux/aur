# Maintainer: tuxflo

pkgname=timeit-git
pkgver=1.9.9.21
pkgrel=1
pkgdesc="Simple workspace based timetracking tool"
arch=('i686' 'x86_64')
url="https://github.com/Hoglet/TimeIT"
license=('gpl-2.0')
depends=('cmake' 'libnotify' 'gtkmm' 'jansson' 'libxss')
#optdepends=('timeit-server')
source=('timeit::git+https://github.com/Hoglet/TimeIT')

md5sums=('SKIP')

build() {
  echo "${pkgname}"
  cd "${srcdir}/timeit"
  cmake .
  make
}

package() {
  #install -dm755 "${pkgdir}/usr/bin"
  cd "${srcdir}/${pgkname}/timeit"
  make DESTDIR="${pkgdir}" install
}
