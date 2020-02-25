# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=tsh3-bin
_pkgname="${pkgname%3-bin}"
pkgver=3.2.16
pkgrel=1
pkgdesc='CLI client used by Teleport Users'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://gravitational.com/teleport'
license=('Apache')
provides=("$_pkgname")
conflicts=(
	"$_pkgname"
	"${_pkgname}3"
	'teleport'
	'teleport-bin'
)
source=("https://get.gravitational.com/teleport-v$pkgver-$_goos-$_goarch-bin.tar.gz")
sha256sums=('aebce44cd87d688e50f11cf6eb3eb9506b72827d07ffbdb50e38691b5b64e08b')

package() {
	install -Dm 755 "$srcdir/teleport/$_pkgname" -t "$pkgdir/usr/bin"
}
