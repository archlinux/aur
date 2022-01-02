# Maintainer: Viktor Nagy <viktor.nagy1995@gmail.com>
pkgname='lsx-git'
pkgver=1
pkgrel=2
pkgdesc="Navigate through terminal like a pro"
arch=('x86_64')
url="https://github.com/souvikinator/lsx"
license=('MIT')
depends=()
optdepends=()
makedepends=('git')
provides=("${pkgname%-git}")
source=('lsx-git::git://github.com/souvikinator/lsx.git')

md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/$pkgname"
	chmod u+x install.sh
    sudo install.sh
}
