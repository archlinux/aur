# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=taskopen
pkgver=1.1.3
pkgrel=1
pkgdesc="Script for taking notes and open urls with taskwarrior"
arch=('i686' 'x86_64')
url="http://github.com/ValiValpas/taskopen/"
license=('GPL')
depends=('perl' 'perl-json' 'task>=2.4.0')
makedepends=('git' 'make')
source=("https://github.com/ValiValpas/taskopen/archive/v${pkgver}.tar.gz")
sha256sums=("55a00a2b947f2415934f1b6bd98ca69e3f85cf07da3be4e3f6841198037b9caa")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make PREFIX="/usr" || return 1
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
