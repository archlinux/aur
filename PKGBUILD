# Maintainer: Dorian Bourgeoisat <dorian dot bourgeoisat at icloud dot com>
pkgname=ttf-comic-mono-git
pkgver=r21.03b5ad8
pkgrel=1
pkgdesc="like the famous font but monospace and with adjusted metric"
license=('MIT')
arch=('any')
url="https://dtinth.github.io/comic-mono-font/"
makedepends=('git')
provides=("comic-mono")

source=("git+https://github.com/dtinth/comic-mono-font.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/comic-mono-font"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 'comic-mono-font/'*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
	install -Dm644 'comic-mono-font/LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname%-*}"
}
