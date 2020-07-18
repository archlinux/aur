# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=webdump
pkgname=${_pkgname}-git
pkgver=r101.254e833
pkgrel=1
pkgdesc='Render HTML to stdout'
arch=('x86_64')
url='https://www.codemadness.org/git/webdump/file/README.html'
license=('ISC')
makedepends=('git')
provides=("${_pkgname}")
source=("git://git.codemadness.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${_pkgname}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${_pkgname}" install
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
