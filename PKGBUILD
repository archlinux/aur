# Maintainer: Valère Monseur <archlinux at vale dot re>

pkgname=ytree
pkgver=2.10
pkgrel=1
pkgdesc='A curses-based file manager similar to DOS Xtree(tm)'
arch=('i686' 'x86_64' 'armv6h')
url='https://www.han.de/~werner/ytree.html'
license=('GPL-2.0-or-later')
depends=('ncurses' 'readline')
backup=('etc/ytree.conf')
source=(https://www.han.de/~werner/"${pkgname}"-"${pkgver}".tar.gz)
md5sums=('9a3a20a78f4fc181389273d6d620dfe0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/man/man1

  make DESTDIR="${pkgdir}"/usr install

  install -Dm644 ytree.conf "${pkgdir}"/etc/ytree.conf
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}
