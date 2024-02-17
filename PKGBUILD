# Maintainer: Valère Monseur <archlinux at vale dot re>

pkgname=ytree
pkgver=2.06
pkgrel=1
pkgdesc='A curses based file manager similar to DOS Xtree(tm)'
arch=('i686' 'x86_64' 'armv6h')
url='https://www.han.de/~werner/ytree.html'
license=('GPL2')
depends=('ncurses' 'readline')
backup=('etc/ytree.conf')
source=(https://www.han.de/~werner/"${pkgname}"-"${pkgver}".tar.gz)
md5sums=('84a51ce2e035930164ece2492d0c07f5')

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
