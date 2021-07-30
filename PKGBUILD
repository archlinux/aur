# Maintainer: ZjeuhPiung <sophgn@outlook.com>

pkgname=one-click-optimizer-git
pkgver=r4.3643d44
pkgrel=1
pkgdesc='Optimize your system in one click'
arch=('x86_64')
url='https://github.com/sophgn/one_click_optimizer'
license=('MIT')
depends=()
makedepends=('cargo')
provides=("one-click-optimizer")
conflicts=("one-click-optimizer")
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  export CFLAGS="-fcommon -fPIE"
  cargo build --release
}

package() {
  install -Dm755 ${srcdir}/${pkgname}/target/release/one_click_optimizer ${pkgdir}/usr/bin/one_click_optimizer
}

# vim: ts=2 sw=2 et:
