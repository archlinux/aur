# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: vscncls <lucaslou4@protonmail.com>

_pkgname='quich'
pkgname="${_pkgname}-git"
pkgver=3.0.0.r16.g446e5e3
pkgrel=1
pkgdesc='Small, easy to use, fast and useful calculator for your terminal with numerous features'
arch=('x86_64')
url='https://github.com/Usbac/quich'
license=('MIT')
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
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
