# Maintainer: TechnicJelle <technicjelleplay@gmail.com>
pkgname=discord-reactor-git
_pkgname="${pkgname%-git}"
pkgver=r14.ae82491
pkgrel=1
pkgdesc="Command-line tool to turn a sentence into Discord reaction messages"
arch=('any')
url="https://github.com/TechnicJelle/DiscordReactor"
source=("${_pkgname}::git+$url.git")
license=('MPL2')
makedepends=(git)
depends=(python)
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm 755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm 664 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 664 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
