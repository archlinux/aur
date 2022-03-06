# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

_pkgname=runjail
pkgname="${_pkgname}-git"
provides=("${_pkgname}")
pkgver=r100.a755f93
pkgrel=1
pkgdesc='runjail is a tool to create ad-hoc sandboxes on Linux'
arch=('x86_64')
url='https://github.com/debfx/runjail'
makedepends=('git' 'go' 'libseccomp')
license=('GPL3')
source=("git+https://github.com/debfx/runjail.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  go build .
}

package() {
  cd "${_pkgname}"
  install -Dm 755 runjail -t "${pkgdir}/usr/bin"
}
