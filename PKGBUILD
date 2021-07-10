# Maintainer: novenary <streetwalkermc@gmail.com>

_pkgname=hacksaw
pkgname=${_pkgname}-git
pkgver=r52.d5254c2
pkgrel=2
pkgdesc="Utility to select screen regions"
arch=('x86_64')
url="https://github.com/neXromancers/${_pkgname}"
license=('MPL2')
depends=('gcc-libs' 'libxcb')
makedepends=('cargo')
source=("git+https://github.com/neXromancers/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 target/release/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}

# vim:set ts=2 sw=2 et:
