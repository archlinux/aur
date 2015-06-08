# $Id$
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=l-smash
pkgver=2.3.0
pkgrel=1
pkgdesc='A simple tool for MP4'
arch=('i686' 'x86_64')
url='https://github.com/l-smash/l-smash'
license=('custom')
depends=('glibc')
source=("l-smash-${pkgver}.tar.gz::https://github.com/l-smash/l-smash/archive/v${pkgver}.tar.gz")
sha256sums=('1c1a487191b723a486bd3e8abd5e28e0d34f7ac1964d98fac0a9a2db962e3838')

build() {
  cd l-smash-${pkgver}

  ./configure \
    --prefix='/usr' \
    --enable-shared \
    --disable-static
  make
}

package() {
  cd l-smash-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
