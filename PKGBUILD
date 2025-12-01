# Maintainer: Feeeeddmmmeee <>
# Maintainer: Dromader2137 <dromader2137@proton.me>
pkgname='dora-git'
pkgver=r169.d075a05
pkgrel=1
pkgdesc="A feature-rich TUI file explorer written in bash"
arch=('x86_64')
url="https://github.com/Feeeeddmmmeee/dora"
license=('MIT')
depends=(
	'bash'
	'coreutils'
	'grep'
	'file'
)
makedepends=('git')
optdepends=(
	'xdg-utils: opening non-text files'
	'highlight: colorized file previews'
)
source=("git+https://github.com/Feeeeddmmmeee/dora")
sha256sums=('SKIP')

pkgver() {
	cd dora
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd dora
	make DESTDIR="$pkgdir/" install
}
