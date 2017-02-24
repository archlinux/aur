# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

_gitname="bpkg"
pkgname="${_gitname}-git"
pkgver=0.2.8.22.g0617f26
pkgrel=1
pkgdesc="Lightweight bash package manager"
arch=("any")
url="https://bpkg.io"
license=("MIT")
depends=("bash")
makedepends=("git")
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+https://github.com/bpkg/${_gitname}")
md5sums=("SKIP")

pkgver() {
  cd "${_gitname}"
  git describe --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"
  PREFIX="${pkgdir}/usr" ./setup.sh
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
