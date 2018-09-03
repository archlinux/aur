# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=haunt
pkgver=0.2.2
pkgrel=1
pkgdesc="Static site generator written in Guile Scheme"
arch=('any')
url="https://haunt.dthompson.us"
license=('GPL3')
depends=('guile')
optdepends=('guile-reader: Skribe support'
            'guile-commonmark: CommonMark support')
makedepends=('guile-reader' 'guile-commonmark')
source=("https://files.dthompson.us/haunt/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4520e3f8793588559eafe6dd0d6b4bea2e892b3a9c2bdcd740e164bd453690cc98f97ae3d30ce385203739ca6735ea6c321f05a3e1336035a00f780b06859ff2')

build() {
  cd "$pkgname"-"$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/" install
}
