# Maintainer: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>
pkgname=osh
_pkgname=oil
pkgver=0.6.pre20
pkgrel=1
pkgdesc="A bash-compatible UNIX shell written in Python."
arch=("x86_64" "i686")
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
source=("https://www.oilshell.org/download/$_pkgname-$pkgver.tar.gz")
md5sums=("c0285afe92cbd5ef3742b9ccae7bda49")
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
