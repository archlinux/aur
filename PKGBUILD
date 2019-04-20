# Maintainer: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>
pkgname=osh
_pkgname=oil
pkgver=0.6.pre18
pkgrel=1
pkgdesc="A bash-compatible UNIX shell written in Python."
arch=("x86_64" "i686")
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
source=("https://www.oilshell.org/download/$_pkgname-$pkgver.tar.gz")
md5sums=("f097f5a62224e5162324d8a3415b63f2")
depends=("readline")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix="$pkgdir/usr"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  ./install
}
