# Contributor: grimi <grimi at poczta dot fm>

pkgname=undms
pkgver=1.3
pkgrel=1
pkgdesc="Decompress Amiga DMS disk images to ADF"
arch=('i686' 'x86_64')
url="http://aminet.net/package/misc/unix/undms-1.3.c"
license=('freedist')
makedepends=('p7zip')
source=("http://aminet.net/misc/unix/${pkgname}-${pkgver}.c.Z")
md5sums=('7c9d5a4830d0e1ded7eab3a287f15c4b')

build() {
  7z x ${pkgname}-${pkgver}.c.Z
  gcc ${CFLAGS} ${LDFLAGS} ${pkgname}-${pkgver}.c -o${pkgname}
}

package() {
  install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
