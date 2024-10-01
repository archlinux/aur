
# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>
pkgname=pokego-git
_pkgname=pokego
pkgrel=1
pkgver=r9.13b23756%
pkgdesc="CLI utility that prints unicode sprites of pokemon to the terminal"
arch=('any')
url="https://github.com/rubiin/pokego.git"
license=("GPL-3.0")
depends=('coreutils' 'go')
makedepends=('git')
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

build() {
    cd "$_pkgname"
    go build -o pokego
}

package() {
	  cd "$_pkgname"
    install -Dm755 pokego "$pkgdir/usr/bin/pokego"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
