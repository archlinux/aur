# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=taskopen
pkgver=2.0.0beta
pkgrel=1
pkgdesc="Script for taking notes and open urls with taskwarrior"
arch=('i686' 'x86_64')
url="http://github.com/jschlatow/taskopen/"
license=('GPL')
depends=('task>=2.5.0')
optdepends=('xdg-utils: easily use default application associated with a file type')
makedepends=('make' 'nim')
source=("https://codeload.github.com/jschlatow/taskopen/tar.gz/v${pkgver}")
sha256sums=("2487cc132118041b9a49a4ff956caedfa6ec70d93d3cd903601de166e2d0246a")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make PREFIX="/usr" || return 1
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" PREFIX="/usr" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
