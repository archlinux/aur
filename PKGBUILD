# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=port-checker
pkgver=0.4.0
pkgrel=1

pkgdesc='Application to check if a TCP port works with a Golang HTTP server'
url='https://github.com/qdm12/port-checker/'
arch=('x86_64' 'aarch64' 'i686')
license=('MIT')
source=("git+${url}#tag=v${pkgver}")
sha256sums=('f02f8bde0552986eecb9091a88ab7c945d05869e6b461b41da6e2a6769470c19')

build() {
  cd "${srcdir}/${pkgname}"
  go build
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 port-checker -t "${pkgdir}/usr/bin/"
  install -Dm 644 LICENSE -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et
