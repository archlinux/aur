# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=ncx
appname=ncx
pkgver=2.0.5a
pkgrel=1
pkgdesc="CLI tool for system management and configuration"
arch=('x86_64')
url="https://gitlab.com/nathanchere/ncx"
license=('Apache-2.0')
depends=()
makedepends=('go' 'git' 'make')
source=("${appname}::git+https://gitlab.com/nathanchere/ncx.git#tag=v${pkgver}")
sha256sums=('cc6a9e32aec8bfca92125c7f5e623d20906c69d357346541ab7910d95c58e317')
options=('!strip' '!emptydirs')

prepare() {
	cd "$srcdir/$appname"
	make setup
}

build() {
	cd "$srcdir/$appname"
	make build
}

# check() {
# 	# cd "$srcdir/$appname/src"
# 	# make testci
# }

package() {
	cd "$srcdir/$appname"
	
	install -Dm755 bin/ncx "$pkgdir/usr/bin/ncx"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
