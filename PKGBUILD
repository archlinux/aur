# Maintainer: Patrick Lühne <patrick-arch@luehne.de>
pkgname=plasp
pkgver=3.0.3
pkgrel=1
epoch=
pkgdesc="A translator from PDDL to ASP"
arch=('x86_64' 'i686')
url="https://github.com/potassco/plasp"
license=('MIT')
groups=()
depends=('boost-libs')
makedepends=('boost' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/potassco/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('2ecd24c675b69fb9fda8c50b8ffefede')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -D build/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
