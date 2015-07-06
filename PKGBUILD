# Maintainer: Zoltan Tombol <zoltan (dot) tombol (plus) aur (at) gmail (dot) com>

pkgname=varrick
pkgver=0.2.0
pkgrel=1
pkgdesc="A convenient template engine to just 'Do the thing!'"
arch=(any)
url="https://github.com/ztombol/varrick"
license=('GPL3')
depends=('bash' 'sed')
makedepends=('git' 'ruby-ronn')
checkdepends=('bats-git')
conflicts=("${pkgname}-git")
source=("$pkgname::git+https://github.com/ztombol/$pkgname#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make build
}

check() {
  cd "$srcdir/$pkgname"
  make -k check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" \
       PREFIX='/usr' \
       LIBEXECDIR='/usr/lib' \
       install
}

# vim:set ts=2 sw=2 et:
