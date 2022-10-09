# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## GPG keys available at https://github.com/torchedsammy.gpg

pkgname=lua-lunacolors-git
pkgver=0.1.0.r3.g8467b87
pkgrel=1
pkgdesc="ANSI colors library for Hilbish"
arch=('any')
url="https://github.com/rosettea/lunacolors"
license=('BSD')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('784DF7A14968C5094E16839C904FC49417B44DCD' ## sammy (TorchedSammy)
              '5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') ## GitHub

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	install -Dm644 init.lua -t "$pkgdir/usr/share/hilbish/libs/lunacolors/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
