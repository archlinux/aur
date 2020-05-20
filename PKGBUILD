# Maintainer: Pierre Mavro <deimosfr@gmail.com>
pkgname=jeedom-status
pkgver=0.6.0
pkgrel=1
pkgdesc="Add Jeedom global status to your favorite desktop bar (i3blocks, polybar, etc...)"
arch=(x86_64)
url="https://github.com/deimosfr/jeedom-status"
license=('GPL')
depends=()
makedepends=(git go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/deimosfr/jeedom-status/archive/v$pkgver.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o jeedom-status main.go
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
