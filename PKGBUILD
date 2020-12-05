# Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=jfetch-git
pkgver=r49.d7f0b60
pkgrel=1
pkgdesc="A minimal Linux fetch script"
arch=('any')
url="https://github.com/Jimmysit0/jfetch"
license=('MIT')
depends=()
makedepends=()
optdepends=()
provides=('jfetch')
conflicts=()
source=('jfetch-git::git+https://github.com/Jimmysit0/jfetch.git'
	'https://raw.githubusercontent.com/Jimmysit0/jfetch/master/LICENSE')
md5sums=('SKIP'
         '12786834660fb952a20bbdd479e264bc')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
