# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>

_name=zsh-system-clipboard
pkgname="${_name}-git"
pkgver=r99.461cbbd
pkgrel=1
pkgdesc='Synchronize system clipboard with ZLE (Zsh Line Editor) registers'
arch=('any')
url="https://github.com/kutsan/zsh-system-clipboard"
license=('GPL3')
depends=('zsh')
makedepends=('git')
optdepends=(
	'xclip: clipboard utility'
	'xsel: clipboard utility'
)
install="${pkgname}.install"
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_name}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${_name}"
	install -Dm644 "${_name}.zsh" -t "$pkgdir/usr/share/zsh/plugins/${_name}"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${_name}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${_name}"
}
