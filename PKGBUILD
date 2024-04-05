# Maintainer: fossdd <fossdd@pwned.life>
pkgname=hedgedoc-cli-git
_pkgname=hedgedoc-cli
pkgver=r97.defeac8
pkgrel=1
pkgdesc='A tiny CLI for HedgeDoc'
arch=('any')
url="https://github.com/hedgedoc/cli"
license=('AGPL-3.0')
depends=('curl' 'wget' 'jq')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "$srcdir/$pkgname/bin/hedgedoc" "$pkgdir/usr/bin/hedgedoc"
	ln -s "$pkgdir/usr/bin/hedgedoc" "$pkgdir/usr/bin/codimd"
}
