# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=taskopen
pkgver=1.0.2
pkgrel=1
pkgdesc="Script for taking notes and open urls with taskwarrior"
arch=('i686' 'x86_64')
url="http://github.com/ValiValpas/taskopen/"
license=('GPL')
depends=('perl' 'perl-json' 'task>=2.0.0')
makedepends=('git' 'make')
source=("https://github.com/ValiValpas/taskopen/archive/v${pkgver}.tar.gz")
sha256sums=("06430d66265513ebdada2caa33cf1ee5585cc9bfabb91da13ae8acc376619d86")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make PREFIX="/usr" || return 1
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
