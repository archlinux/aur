# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=2.3.10
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('f95c1331f49a1adf795b2516acaee1514ccfa32cefabe7b8f867805c1d8b5d286f82d09c2b983aa4af57205a73d5ae1c9e89e29816162586f7f691813fdbcae5')
package() {
	# binary
	install -Dm755 ./$_pkgname "$pkgdir/usr/bin/$_pkgname"
	# manpage
	install -Dm644 ./$_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
	# completions
	if $(command -v fish &>/dev/null); then
		install -Dm644 ./$_pkgname.fish "${pkgdir}/usr/share/fish/completions/$_pkgname.fish"
	fi
	if $(command -v bash &>/dev/null); then
		install -Dm644 ./$_pkgname.bash "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
	fi
	if $(command -v zsh &>/dev/null); then
		install -Dm644 ./$_pkgname.zsh "${pkgdir}/usr/share/zsh/site-functions/_$_pkgname"
	fi
}
