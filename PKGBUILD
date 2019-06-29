# Maintainer: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>
pkgname=osh
_pkgname=oil
pkgver=0.6.pre23
pkgrel=1
pkgdesc="A bash-compatible UNIX shell written in Python."
arch=("x86_64" "i686")
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
source=("https://www.oilshell.org/download/$_pkgname-$pkgver.tar.gz")
md5sums=("69f7b33aa839daf381617bedc7fb159d")
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
