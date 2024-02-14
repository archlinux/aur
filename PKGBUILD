# Maintainer: Mattias Cockburn <mattias.cockburn@iits-consulting.de>
pkgname=stackit-cli
_pkgver=0.1.0-beta.8
pkgver=$(tr -d '-' <<<${_pkgver})
pkgrel=1
epoch=
pkgdesc="a command-line interface for the STACKIT services"
arch=(x86_64 arm64)
url="https://github.com/stackitcloud/stackit-cli"
license=('Apache2')
groups=()
depends=()
makedepends=(go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/stackitcloud/${pkgname}/archive/refs/tags/v${_pkgver}.tar.gz")
noextract=()
validpgpkeys=()

build() {
	cd "$pkgname-$_pkgver"
  go build -v -o stackit-cli .
}

package() {
	cd "$pkgname-$_pkgver"
	install -d -m 0755 "${pkgdir}/usr/bin"
  install -m 0755 stackit-cli "${pkgdir}/usr/bin"
}

sha256sums=('39836eeccc0eb9213e1a0916cd69f0a9a858fb527cc3886ddc4d2f164ebff539')
