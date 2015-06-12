# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pinkie-pie
pkgver=1.1
pkgrel=1
pkgdesc="Madame Pinkie Pie: ponified fortune cookies"
arch=('any')
url="https://github.com/maandree/pinkie-pie"
license=('Public Domain')
depends=('fortune-mod' 'ponypipe' 'sh')
provides=('pinkie-pie')
conflicts=('pinkie-pie')
source=(https://github.com/maandree/pinkie-pie/archive/${pkgver}.tar.gz)
sha256sums=(3700b8e1d8d359c06ca584b08b8b5ce59d906163cd5ca86801d6b52412aa7aa0)


build() {
  cd "${srcdir}/pinkie-pie-${pkgver}"
  make
}

package() {
  cd "${srcdir}/pinkie-pie-${pkgver}"
  make DESTDIR="$pkgdir/" install
}

