pkgname=amber-bash-git
pkgver=master
pkgrel=1
pkgdesc="The programming language compiled to bash"
url="https://amber-lang.com/"
makedepends=('cargo' 'rust')
arch=('any')
license=('GPL3')
provides=('amber-bash')
conflicts=('amber-bash')

source=("git+https://github.com/Ph0enixKM/Amber")
sha256sums=(SKIP)

build() {
	cd "$srcdir/Amber"
	cargo b -r
}

package() {
	cd "$srcdir/Amber/target/release"

	install -Dm755 amber "$pkgdir/usr/bin/amber"
}

