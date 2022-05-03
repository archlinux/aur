# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=packwiz-bin
pkgver=r194.efb434d
pkgrel=1
pkgdesc='A command line tool for editing and distributing Minecraft modpacks (Git auto-update)'
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL3')
source=("https://nightly.link/packwiz/packwiz/workflows/go/master/Linux%2064-bit%20x86.zip")
provides=('packwiz')
conflicts=('packwiz')
makedepends=('curl' 'git' 'htmlq')
sha256sums=('SKIP')

pkgver() {
	commit_count="$(curl 'https://github.com/packwiz/packwiz/' | htmlq --text '.d-sm-inline strong')"
	commit_hash="$(git ls-remote --heads 'https://github.com/packwiz/packwiz/' | head -n1 | cut -c1-7)"
	printf 'r%s.%s' "$commit_count" "$commit_hash"
}

package() {
	install -Dm755 packwiz -t "$pkgdir/usr/bin"
}
