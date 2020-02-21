# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=tsh3-bin
_pkgname="${pkgname%3-bin}"
pkgver=3.2.15
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
sha256sums=('5a3c70578ce2ee7cb821f61d2f808528d30271ca25281b71e90839c68c9105c9')

package() {
	install -Dm 755 "$srcdir/teleport/$_pkgname" -t "$pkgdir/usr/bin"
}
