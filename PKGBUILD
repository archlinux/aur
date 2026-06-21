# Maintainer: zocker_160 <zocker1600 at posteo dot net>
# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Joel Snape <aur@sna.pe>

pkgname=rehex
pkgver=0.64.0
pkgrel=2
pkgdesc="A cross-platform (Windows, Linux, macOS) hex editor for reverse engineering, and everything else"
arch=('x86_64')
url="https://github.com/solemnwarning/rehex"
license=('GPL-2.0-only')
depends=('jansson' 'capstone' 'wxwidgets-gtk3' 'lua>=5.5' 'botan')
makedepends=('zip' 'perl-template-toolkit' 'busted' 'git')
source=("$pkgname-$pkgver::git+https://github.com/solemnwarning/rehex.git#tag=$pkgver")
sha256sums=('2220b368833ae84527d5e0ce358861b9cfa5d7625b2b5bcb0abad3ce9b60d08e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix="/usr" install
}
