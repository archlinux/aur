# Maintainer: Babz <babz+aur@tfnux.org>

pkgname=ricochet-irc
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc=""
arch=('any')
url="https://github.com/adraenwan/ricochet-irc"
license=('BSD')
groups=()
depends=('qt5-base' 'protobuf')
makedepends=('qt5-tools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"https://github.com/adraenwan/ricochet-irc/archive/v${pkgver}/v${pkgver}.tar.gz"
	"ricochet-irc.service")
noextract=()
sha256sums=(
	'590f00977dfe26c8edfb1135173a87b3518378d5064455868b1a39c8032496fa'
	'6140077bfbf75eae190d221c77f5c540d98fff188b0839a21919d29107763af7')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"

	qmake ricochet-irc.pro
	make release
}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	install -D -m 644 ricochet-irc.service ${pkgdir}/usr/lib/systemd/user/${pkgname}.service

	cd "$pkgname-$pkgver"

	install -D -m 755 ricochet-irc ${pkgdir}/usr/bin/${pkgname}
}
