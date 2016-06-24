# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=taskopen
pkgver=1.1
pkgrel=1
pkgdesc="Script for taking notes and open urls with taskwarrior"
arch=('i686' 'x86_64')
url="http://github.com/ValiValpas/taskopen/"
license=('GPL')
depends=('perl' 'perl-json' 'task>=2.4.0')
makedepends=('git' 'make')
source=("https://github.com/ValiValpas/taskopen/archive/v${pkgver}.tar.gz")
sha256sums=("2efca2e816883d328cea4f32bd553ea5992a3221ad10f6de265543fe17429a4b")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make PREFIX="/usr" || return 1
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
