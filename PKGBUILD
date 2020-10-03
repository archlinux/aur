# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='rotcheck'
pkgname="${_pkgname}-git"
pkgver=1.1.2.r0.g33f0d52
pkgrel=1
pkgdesc='Recursively generate, update and verify checksums for your files'
arch=('any')
url='https://github.com/jamielinux/rotcheck'
license=('MIT')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:

