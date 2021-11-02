# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=taskopen
pkgver=1.1.5
pkgrel=1
pkgdesc="Script for taking notes and open urls with taskwarrior"
arch=('i686' 'x86_64')
url="http://github.com/ValiValpas/taskopen/"
license=('GPL')
depends=('perl' 'perl-json' 'task>=2.4.0')
optdepends=('xdg-utils: easily use default application associated with a file type')
makedepends=('git' 'make')
source=("https://codeload.github.com/ValiValpas/taskopen/tar.gz/v${pkgver}")
sha256sums=("edf9dc76dd70089e3334bac27fddf24450fc4385d0dc3089d7ecc983d19c977c")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make PREFIX="/usr" || return 1
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
