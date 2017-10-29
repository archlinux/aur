# Maintainer: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>
pkgname=osh
_pkgname=oil
pkgver=0.1.0
pkgrel=1
pkgdesc="A bash-compatible UNIX shell written in Python."
arch=("x86" "x86_64")
url="https://www.oilshell.org/"
license=('Apache-2.0')
groups=($_pkgname)
options=(!strip)
source=("https://www.oilshell.org/download/$_pkgname-$pkgver.tar.gz")
md5sums=("93410c0ed6f0170713b49c038de68383")
depends=("readline")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix="$pkgdir/usr"
  make
}

die() {
  echo "FATAL install error: $@" 1>&2
  exit 1
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  ./install
}
