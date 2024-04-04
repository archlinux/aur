# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: David C. Rankin <drankinatty at gmail dot com>

pkgname=cflow
pkgver=1.7
pkgrel=2
pkgdesc="A C program flow analyzer"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/cflow/"
license=('GPL-3.0-or-later')
depends=('glibc')
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig})
b2sums=('0d015f66a1cdeb5119d09c6a81231414362bb5a130d744a4532f3eac7de54f05472716afdcf244d413f510f2f955655654192ef467c56588a09a69b064bd43b7'
        'SKIP')
validpgpkeys=('325F650C4C2B6AD58807327A3602B07F55D0C732')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
