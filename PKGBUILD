# Maintainer: Jamie Macdonald <jamie.alban@gmail.com>
pkgname=taskell
pkgver=1.4.3
pkgrel=1
pkgdesc='A command line kanban board/task manager written in Haskell'
arch=('x86_64')
url="https://github.com/smallhadroncollider/taskell"
license=('custom')
depends=(ncurses zlib gmp)
makedepends=(stack)
conflicts=(taskell-bin)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('3aec117a845542513f6f674f5841c6edc5e494ad313b1f0572c224971d359ff0')

build() {
  cd "$pkgname-$pkgver"
  stack build
}

package() {
  cd "$pkgname-$pkgver"
  stack install --local-bin-path "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
