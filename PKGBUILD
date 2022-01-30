# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: David C. Rankin <drankinatty at gmail dot com>

pkgname=cflow
pkgver=1.7
pkgrel=1
pkgdesc="A C program flow analyzer."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/cflow/"
license=('GPL')
depends=('glibc')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('9e278b10ea420a1ab7ecccd8335fc31fb1921e91ab99d77e33df0729e19dca3b'
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
