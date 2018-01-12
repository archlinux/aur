# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=piu-piu-sh-git
pkgver=r223.6fc9547
pkgrel=1
pkgdesc="Old School horizontal scroller 'Shoot Them All' game in bash"
arch=('any')
url="https://github.com/vaniacer/piu-piu-SH"
license=("MIT")
provides=('piu-piu-sh')
conflicts=('piu-piu-sh')
depends=('bash' 'ncurses')
makedepends=('git')
source=("git+https://github.com/vaniacer/piu-piu-SH")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/piu-piu-SH"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/piu-piu-SH"
  sed -n '/License/,/SOFTWARE\./p' piu-piu > LICENSE
}

package() {
  cd "${srcdir}/piu-piu-SH"
  install -Dm755 piu-piu "${pkgdir}/usr/bin/piu-piu"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
