# Maintainer: Andrea Fiori <andrea.fiori.1998@gmail.com>
pkgname='lanthanum-git'
_pkgname='lanthanum'
pkgver=r149.d74bc01
pkgrel=1
pkgdesc='A small byte code interpreted programming language'
arch=('x86_64')
url="https://github.com/fioriandrea/lanthanum"
license=('MIT')
depends=('glibc')
makedepends=('git')
source=("$_pkgname::git+https://github.com/fioriandrea/lanthanum.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
    install -Dm755 ./lanthanum "$pkgdir/usr/bin/lanthanum" 
    install -Dm644 ./README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
    install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
