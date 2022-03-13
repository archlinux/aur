# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>

pkgname=libvterm-014
pkgver=0.1.4
pkgrel=1
pkgdesc='Abstract library implementation of a VT220/xterm/ECMA-48 terminal emulator'
arch=('x86_64')
url='https://www.leonerd.org.uk/code/libvterm/'
license=('MIT')
depends=('glibc')
makedepends=('git')
source=("https://www.leonerd.org.uk/code/libvterm/libvterm-0.1.4.tar.gz")
sha256sums=('bc70349e95559c667672fc8c55b9527d9db9ada0fb80a3beda533418d782d3dd')
provides=('libvterm')
conflicts=('libvterm')

build() {
  cd "${pkgname%014}${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname%014}${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
