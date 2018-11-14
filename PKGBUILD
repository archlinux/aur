# Maintainer: Moritz Patelscheck <moritz(at)patelscheck.de>
pkgname=passmate
pkgver=v0.4.alpha
pkgrel=1
epoch=
pkgdesc="a cross-platform, open-source password manager"
arch=('i686' 'x86_64')
url="https://github.com/TobiasKaiser/passmate"
license=('Apache')
groups=()
depends=('libscrypt' 'mbedtls' 'wxgtk3')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/TobiasKaiser/passmate.git)
noextract=()
md5sums=('SKIP')

build() {
	cd "$pkgname/client"
	export WX_CONFIG=/usr/bin/wx-config-gtk3
	cmake . -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$pkgname/client"
	install -Dm644 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
