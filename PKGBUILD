# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="movie-rename-bin"
_pkgname="movie-rename"
pkgver=2.3.3
pkgrel=1
pkgdesc="A simple tool to rename movies, written in Rust."
arch=('x86_64')
url="https://github.com/SinTan1729/$_pkgname"
license=('GPL3')
provides=('movie-rename')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname.tar.gz")
b2sums=('f7e0c27a2b4625f4e610fbbc9c96dbb93966a132b9d4e40cf38df71131fa23ae201bdfee58f937ec89e962db9a9231da2667890148680f22b11570227bf502bc')
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
