# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=txt2epub
pkgname=${_pkgname}-git
pkgver=0.0.1.r0.g73b0c60
pkgrel=1
pkgdesc='Convert one or more plain text files into an EPUB document'
arch=('x86_64' 'i686')
url='https://github.com/kevinboone/txt2epub'
license=('GPL3')
makedepends=('git')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${_pkgname}"
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}/man1/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
