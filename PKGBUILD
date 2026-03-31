# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

_pkgname=port-checker
pkgname="${_pkgname}-git"
pkgver=v0.4.0.r0.d6c661d
pkgrel=1

pkgdesc='Application to check if a TCP port works with a Golang HTTP server'
url='https://github.com/qdm12/port-checker/'
arch=('x86_64' 'aarch64' 'i686')
license=('MIT')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  git -C "${srcdir}/${_pkgname}" describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  go build
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 port-checker -t "${pkgdir}/usr/bin/"
  install -Dm 644 LICENSE -T "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et
