# Maintainer: Syn Carson ploscarusynxy@gmail.com

pkgname=synfetch-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="Universal blazingly fast system fetch for Linux distros and macOS"
arch=('any')
url="https://github.com/SXSLVT/synfetch"
license=('custom')
depends=('bash')
makedepends=('git')
provides=('synfetch')
conflicts=('synfetch')
source=("git+https://github.com/SXSLVT/synfetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/synfetch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/synfetch"
  install -Dm755 synfetch "${pkgdir}/usr/bin/synfetch"
}
