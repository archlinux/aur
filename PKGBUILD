# Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=jfetch-git
pkgver=r65.4fa1731
pkgrel=1
pkgdesc="A minimal Linux fetch script"
arch=('any')
url="https://github.com/Jimmysit0/jfetch"
license=('MIT')
depends=()
makedepends=('make')
optdepends=()
provides=('jfetch')
conflicts=()
source=('jfetch-git::git+https://github.com/Jimmysit0/jfetch.git'
	'https://raw.githubusercontent.com/Jimmysit0/jfetch/master/license')
md5sums=('SKIP'
         '10530c5d870f9e86d4b0e7b24a4e72fa')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
