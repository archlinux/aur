# Contributor: grimi

pkgname=undms
pkgver=1.3
pkgrel=2
pkgdesc="Decompress Amiga DMS disk images to ADF"
arch=('i686' 'x86_64')
url="https://aminet.net/package/misc/unix/undms-1.3.c"
license=('freedist')
makedepends=('p7zip')
source=("https://aminet.net/misc/unix/${pkgname}-${pkgver}.c.Z")
sha256sums=('d5c5396d1003f4d4125b4fe4833043e207b7315e87db3be92c2188ffbe27e8ac')

build() {
  7z x ${pkgname}-${pkgver}.c.Z
  gcc ${CFLAGS} ${LDFLAGS} ${pkgname}-${pkgver}.c -o${pkgname}
}

package() {
  install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
