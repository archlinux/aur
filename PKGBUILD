# Maintainer: 2ion <dev@2ion.de>
pkgname=bunsen-common-git
pkgver=r7.5ec5e6f
pkgrel=1
pkgdesc="Shared shell scripts commonly used in BunsenLinux projects"
arch=('any')
url="https://github.com/BunsenLabs/bunsen-common"
license=('GPL3')
depends=('bash' 'ncurses')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/BunsenLabs/bunsen-common.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/${pkgname%-git}"
  bash -n bl-include.cfg
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm 755 bl-include.cfg "${pkgdir}/usr/lib/bunsen/bunsen-common/bl-include.cfg"
}
