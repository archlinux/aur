# Maintainer: Aleksander Mietinen <aleksander at mietinen dot net>

pkgname=pspy-bin
_pkgbase=pspy
pkgver=1.2.0
pkgrel=1
pkgdesc="Monitor linux processes without root permissions."
arch=('any')
url="https://github.com/DominicBreuker/pspy"
license=('GPL')
makedepends=('findutils')
conflicts=("$_pkgbase")
provides=("$_pkgbase")

source=(
	"${_pkgbase}32::$url/releases/download/v$pkgver/${_pkgbase}32"
	"${_pkgbase}32s::$url/releases/download/v$pkgver/${_pkgbase}32s"
	"${_pkgbase}64::$url/releases/download/v$pkgver/${_pkgbase}64"
	"${_pkgbase}64s::$url/releases/download/v$pkgver/${_pkgbase}64s"
)
sha256sums=(
	'7cd8fd2386a30ebd1992cc595cc1513632eea4e7f92cdcaee8bcf29a3cff6258'
	'0265a9d906801366210d62bef00aec389d872f4051308f47e42035062d972859'
	'f7f14aa19295598717e4f3186a4002f94c54e28ec43994bd8de42caf79894bdb'
	'c769c23f8b225a2750768be9030b0d0f35778b7dff4359fa805f8be9acc6047f'
)

package() {
	cd "$srcdir"
	find . -name "${_pkgbase}*" -print0 | \
		xargs -I{} -0 install -Dm755 {} "$pkgdir/usr/share/$_pkgbase/{}"
}
