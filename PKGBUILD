# Maintainer: Nathan Zadoks <nathan@nathan7.eu>
pkgname=bpf-tools
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux net/tools BPF tools"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('glibc' 'ncurses' 'readline' 'zlib')
source=("git://github.com/nathan7/bpf-tools.git#commit=98314a50c8a71df7ea89290ac31b96a6e3fb5bea")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}/usr" install
}

# vim:set ts=2 sw=2 et:
