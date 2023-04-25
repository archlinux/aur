#Maintainer: Daniel Lehmann <daniellehmann28@outlook.de>
pkgname=sliver
pkgver=1.5.37
pkgrel=1
pkgdesc="Sliver is a an opensource C2 framework designed by bishop fox"
url="https://github.com/BishopFox/sliver"
arch=('any')
depends=()
makedepends=('go>=1.18' 'make' 'sed' 'tar' 'curl' 'zip')
optdepends=()
license=('BSD-3-Clause')
provides=("${pkgname}")
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BishopFox/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('587fe4a52764675c8f6c3c94a271342a6d6789cad7c5f45edd1c71d41a771ae2')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
    make
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "$srcdir/${pkgname}-${pkgver}/${pkgname}-server" "$pkgdir/usr/bin/${pkgname}-server"
    install -m755 "$srcdir/${pkgname}-${pkgver}/${pkgname}-client" "$pkgdir/usr/bin/${pkgname}-client"
}
