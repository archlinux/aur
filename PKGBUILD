# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='nmly'
pkgname="${_pkgname}-git"
pkgver=1.1.1.r11.gbdb2577
pkgrel=1
pkgdesc='Bulk rename utility with useful functions'
arch=('x86_64')
url='https://github.com/Usbac/nmly'
license=('MIT')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${_pkgname}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${_pkgname}"
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
