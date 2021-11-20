_gitname=xwinwrap
pkgname="${_gitname}"-baitinq-git
pkgdesc="Fork of XwinWrap with some added settings (-r)"
pkgver=0
pkgrel=1
arch=('x86_64')
makedepends=('git')
depends=('libx11' 'libxext' 'libxrender')
provides=('xwinwrap')
conflicts=('xwinwrap')
license=(custom)
url="https://github.com/Baitinq/xwinwrap"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}" || return 1
  printf '0.r%s.%s' \
             "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_gitname}" || return 1
}

package() {
  cd "${_gitname}" || return 1
  install -D xwinwrap "${pkgdir}"/usr/bin/xwinwrap
}

