# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Daniel J Griffiths <griffithsdj@archlinux.us>

pkgname=wyrd
pkgver=1.4.6
pkgrel=3
pkgdesc='A text-based front-end to Remind.'
arch=('i686' 'x86_64')
url='http://pessimization.com/software/wyrd/'
license=('GPL')
depends=('remind' 'ncurses')
makedepends=('ocaml' 'camlp4')
source=("http://pessimization.com/software/wyrd/${pkgname}-${pkgver}.tar.gz")
md5sums=('2fc561482fdac4daac0cb6735d934ebe')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --enable-utf8
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
