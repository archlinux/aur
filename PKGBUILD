# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=ytree
pkgver=1.99pl1
pkgrel=1
pkgdesc='A curses-based file manager similar to DOS Xtree(tm)'
arch=('i686' 'x86_64' 'armv6h')
url='http://www.han.de/~werner/ytree.html'
license=('GPL')
depends=('ncurses' 'readline')
backup=('etc/ytree.conf')
source=(http://www.han.de/~werner/"${pkgname}"-"${pkgver}".tar.gz)
md5sums=('471ef8a4ba033f3118836ad434bb595b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/man/man1
  install -d "${pkgdir}"/usr/share/man/es/man1

  make DESTDIR="${pkgdir}"/usr install

  install -Dm644 ytree.conf "${pkgdir}"/etc/ytree.conf
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}
