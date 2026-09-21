# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=duplito
pkgver=5.0.0
pkgrel=3
pkgdesc="Command-line tool to identify duplicate files on your system"
arch=('x86_64')
url="https://github.com/ftarlao/duplito"
license=('GPL-3.0-or-later')
depends=()
makedepends=('go')
_tag="v5.0.0-Red.Max.Donner.und.Blitzen"
_srcdir="duplito-5.0.0-Red.Max.Donner.und.Blitzen"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/ftarlao/duplito/tar.gz/refs/tags/$_tag")
sha256sums=('706ced7404a769aae5259eb76d928c6f1add5e9ffe1c5de0cb8f0dadf9aae58e')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	go build -trimpath -o "$pkgname" .
}
function package() {
	cd "$_srcdir"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/duplito"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
