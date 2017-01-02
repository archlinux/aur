# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

_pkgname=oppai
pkgname="$_pkgname-git"
pkgver=0.6.2_14_g99f8fa9
pkgrel=1
pkgdesc='osu! pp advanced inspector (oppai) is pp calculator for osu! beatmaps'
arch=('any')
url='https://github.com/Francesco149/oppai'
license=('GPL3')
options=('!strip')
makedepends=('gcc' 'git')
depends=()
optdepends=('curl: For piping beatmaps into oppai')
provides=('oppai')
conflicts=('oppai')
source=("git+https://github.com/Francesco149/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags --always | sed 's/-/_/g'
}

build() {
	cd "$srcdir/$_pkgname"
	./build.sh
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 'oppai.1' "$pkgdir/usr/share/man/man1/oppai.1"
	install -D -m755 'oppai' "$pkgdir/usr/bin/oppai"
}

# vim: set ts=4 sw=4 noet:
