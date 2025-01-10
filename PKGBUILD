# Maintainer: beeender <chenmulong@gmail.com>
pkgname=('richclip')
_pkgname="richclip"
pkgver=0.2.1
pkgrel=0
arch=('x86_64' 'i686')
url='https://github.com/beeender/richclip'
license=('MIT')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/beeender/richclip.git#tag=v$pkgver")
sha256sums=('1d819ce6203179522436d16ef3aca8362410f9a3d847726e3898e8a937ba3ebf')

package_richclip() {
	pkgdesc="Command line clipboard utility for multiple platforms."
	depends=()
	optdepends=()
	provides=('richclip')

	cd "$srcdir/$_pkgname"
	env CARGO_INCREMENTAL=0 cargo build --release

	install -Dm755 "$srcdir/$_pkgname/target/release/richclip" "$pkgdir/usr/bin/richclip"
}
