# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=redditgtk-git
pkgver=51
pkgrel=1
epoch=
pkgdesc="Reddit gtk client"
arch=('any')
url="https://gitlab.gnome.org/GabMus/redditgtk"
license=('GPL3')
groups=()
depends=(
	'gobject-introspection'
	'gtksourceview4'
	'libhandy1'
	'python-flask'
	'python-praw'
)
makedepends=('meson' 'git')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=("SKIP")

build() {
	arch-meson "$pkgname" build

	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build

	cd "$srcdir/$pkgname"
}
