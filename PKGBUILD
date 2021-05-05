# Maintainer: netthier <lp@netthier.net>
pkgname=owofetch-git
pkgdesc="Alternative to *fetch, uwuifies all stats."
pkgver=0.1.r4.g8780b1c
pkgrel=1
arch=('x86_64')
url="https://github.com/netthier/owofetch-rs"
license=('GPL3')
makedepends=('rust' 'cargo')
provides=('owofetch')
source=('git+https://github.com/netthier/owofetch-rs')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/owofetch-rs"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cargo install --no-track --root="$pkgdir" --path "$srcdir/owofetch-rs" owofetch	
}
