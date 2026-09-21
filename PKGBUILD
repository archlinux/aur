# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=go-typ0
pkgver=1.1.2
pkgrel=1
pkgdesc="Interactive CLI tool for typing practice and speed tests, built with Bubble Tea"
arch=('x86_64')
url="https://github.com/TusharIbtekar/go-typ0"
license=('MIT')
depends=()
makedepends=('go')
_tag="v1.1.2"
_srcdir="go-typ0-1.1.2"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/TusharIbtekar/go-typ0/tar.gz/refs/tags/$_tag")
sha256sums=('49c4e2bbdea8a96aefff49b6e1184873a99a668fa8538496307534eb78f33d60')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" ./cmd/typ0
}
function package() {
	cd "$_srcdir"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
