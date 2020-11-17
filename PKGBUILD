# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=kak-mediawiki-git
_reponame=mediawiki.kak
pkgver=r1.a3c1492
pkgrel=1
pkgdesc='MediaWiki syntax highlighting for Kakoune'
arch=(any)
url="https://github.com/Ordoviz/mediawiki.kak"
license=(Unlicense)
depends=(kakoune)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_reponame"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.asciidoc
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/filetype/" mediawiki.kak
}
