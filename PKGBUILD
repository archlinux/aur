# Maintainer: beeender <chenmulong@gmail.com>
pkgname=('glrnvim')
_pkgname="glrnvim"
pkgver=1.1.1
pkgrel=0
arch=('x86_64' 'i686')
url='https://github.com/beeender/glrnvim'
license=('GPL3')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/beeender/glrnvim.git#tag=v$pkgver")
sha256sums=('SKIP')

package_glrnvim() {
	pkgdesc="A GPU-accelerated neovim GUI."
	depends=('neovim')
	optdepends=('alacritty' 'rxvt-unicode' 'kitty')
	provides=('glrnvim')

	cd "$srcdir/$_pkgname"
	env CARGO_INCREMENTAL=0 cargo build --release

	install -Dm755 "$srcdir/$_pkgname/target/release/glrnvim" "$pkgdir/usr/bin/glrnvim"
    install -Dm644 $srcdir/$_pkgname/glrnvim.yml "$pkgdir/usr/share/doc/glrnvim/example/glrnvim.yml"
    install -Dm644 $srcdir/$_pkgname/glrnvim.desktop "$pkgdir/usr/share/applications/glrnvim.desktop"
    install -Dm644 $srcdir/$_pkgname/glrnvim.svg "$pkgdir/usr/share/icons/glrnvim.svg"
}
