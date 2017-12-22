# Maintainer: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>
pkgname=osh
_pkgname=oil
pkgver=0.3.0
pkgrel=1
pkgdesc="A bash-compatible UNIX shell written in Python."
arch=("x86_64" "i686")
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
source=("https://www.oilshell.org/download/$_pkgname-$pkgver.tar.gz")
md5sums=("6936c7f310ec0b31b4659c6cb5df66e2")
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
