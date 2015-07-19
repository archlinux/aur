# Maintainer: lynix <lynix47@gmail.com>

pkgname=journalcheck-git
pkgver=r55.17602cb
pkgrel=1
pkgdesc="A simple replacement for logcheck when using journald"
url="https://github.com/lynix/journalcheck"
arch=('any')
license=('MIT')
depends=('grep' 'systemd')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("git://github.com/lynix/journalcheck.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make PREFIX="${pkgdir}/usr" install
}

# vim:set ts=2 sw=2 et:
