# Maintainer: A. Husen <hello@husen.id>
pkgname=code-minimap-bin
_pkgname=code-minimap
pkgver=0.5.1
pkgrel=1
pkgdesc="A high performance code minimap render."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/wfxr/code-minimap"
license=('MIT' 'APACHE')
provides=('code-minimap')
conflicts=('code-minimap')
source_x86_64=("https://github.com/wfxr/code-minimap/releases/download/v$pkgver/code-minimap-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("https://github.com/wfxr/code-minimap/releases/download/v$pkgver/code-minimap-v$pkgver-i686-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/wfxr/code-minimap/releases/download/v$pkgver/code-minimap-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('194e4fc5d3077933b3f51a09719fa3a9ac415b8435e173c4b3451f46da438e48718c21009cfa2c373c06f0ed2224fa2f1d55925914d572eade1b7d19e38cc722')
sha512sums_i686=('40d8aaf47f3bbc525b76ea464bb199d5f230d53cc60fdeaf5a9c0135a4f58b53993a6e020d1615c99a1cf244b6ea65388ea43b8227509a052d17e0c6695a806e')
sha512sums_aarch64=('be42820dfe830c799febf336261f533e1a245d350321bdc384b78d0c58f561257e7a481c8b50e508afb8e7e42aee679496e357af9151b9c7261711a71044e64c')

package() {
	cd "$srcdir/"

	install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"	
	
	install -Dm644 "completions/bash/${_pkgname}.bash"  "$pkgdir/usr/share/bash-completion/completions/${_pkgname}.bash"
	install -Dm644 "completions/fish/${_pkgname}.fish"  "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm644 "completions/zsh/_${_pkgname}"	    "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
	
	install -Dm644 "README.md"			    "$pkgdir/usr/share/doc/${_pkgname}/README.md"
	
	install -Dm644 "LICENSE-MIT"			    "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE"			    "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}
