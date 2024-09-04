# Maintainer: Luc <luc@dougy147.com>
pkgname=scitopdf
pkgver=0.7.2
pkgrel=1
pkgdesc="Script to quickly fetch scientific papers from Sci-Hub or Libgen."
arch=(x86_64 i686)
url="https://github.com/dougy147/scitopdf.git"
license=('GPL3')
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(scitopdf)
conflicts=(scitopdf-git)
replaces=()
source=("${pkgname}::git+${url}#tag=v${pkgver}")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	PREFIX=/usr
	install -D -m755 "$srcdir/$pkgname/bin/scitopdf" "$pkgdir/usr/bin/scitopdf"
	install -D -m644 "$srcdir/$pkgname/scitopdf.1" "$pkgdir/usr/share/man/man1/scitopdf.1"
}
