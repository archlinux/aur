# Maintainer: Chinmay Dalal <w5vwg64uy@relay.firefox.com>

pkgname=libvterm-014
pkgver=0.1.4
pkgrel=1
pkgdesc='Abstract library implementation of a VT220/xterm/ECMA-48 terminal emulator'
arch=('x86_64')
url='https://github.com/neovim/libvterm'
license=('MIT')
depends=('glibc')
makedepends=('git')
source=("https://www.leonerd.org.uk/code/libvterm/libvterm-0.1.4.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
