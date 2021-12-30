# Maintainer: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
pkgname=dbus-inspect-git
pkgver=v0.dcffffe
pkgrel=1
pkgdesc="Command line dbus inspect written in Go"
license=('MIT')
url="https://github.com/amenzhinsky/dbus-inspect"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('go')
optdepends=()
conflicts=()
source=("dbus-inspect::git://github.com/amenzhinsky/dbus-inspect.git")
sha512sums=("SKIP")

build() {
  cd "dbus-inspect"

	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export CGO_ENABLED=0

  go build .
}

package() {
	cd "dbus-inspect"

	# binary:
  install -Dm755 "dbus-inspect" "$pkgdir/usr/bin/dbus-inspect"
}
