# Maintainer: Luc <luc@dougy147.com>
pkgname=scitopdf
pkgver=0.6.5.r0.g8d4d2b8
pkgrel=1
pkgdesc="bash script to quickly fetch, download and open scientific papers from Sci-Hub's database."
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
source=("${pkgname}::git+${url}")
noextract=()
md5sums=('SKIP')

#build() {
#        #cd "$srcdir/$pkgname-$pkgver"
#        cd "$srcdir/$pkgname"
#        ./configure --prefix=/usr
#        make
#}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	PREFIX=/usr
	install -D -m755 "$srcdir/$pkgname/bin/scitopdf" "$pkgdir/usr/bin/scitopdf"
	install -D -m644 "$srcdir/$pkgname/scitopdf.1" "$pkgdir/usr/share/man/man1/scitopdf.1"
}
