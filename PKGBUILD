# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=taskopen
pkgver=1.1.4
pkgrel=1
pkgdesc="Script for taking notes and open urls with taskwarrior"
arch=('i686' 'x86_64')
url="http://github.com/ValiValpas/taskopen/"
license=('GPL')
depends=('perl' 'perl-json' 'task>=2.4.0')
optdepends=('xdg-utils: easily use default application associated with a file type')
makedepends=('git' 'make')
source=("https://codeload.github.com/ValiValpas/taskopen/tar.gz/v${pkgver}")
sha256sums=("774dd89f5c92462098dd6227e181268e5ec9930bbc569f25784000df185c71ba")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make PREFIX="/usr" || return 1
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
