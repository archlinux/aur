# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=2.3.4
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('e2ee529cfba523e2390c2430016fea7691e2f9d7f79fd7cd40156feedf1d6890ce47f732646d58de09b6759e2bd11b5a69688050d655f8709933985cb8512141')
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
