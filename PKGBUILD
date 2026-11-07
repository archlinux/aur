# Maintainer: Ash <xash at riseup d0t net>
# Former Maintainer: Pierre Depaz <pierre@enframed.net>
pkgname=liquidsoap-prettier
pkgver=1.9.0
pkgrel=1
epoch=
pkgdesc="Prettier plugin for liquidsoap script"
arch=("any")
url="https://github.com/savonet/liquidsoap-prettier"
license=('unknown')
groups=()
depends=("nodejs")
makedepends=("npm")
checkdepends=()
optdepends=()
provides=("liquidsoap-prettier")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f0e01c44bb9d454a13152a506ff440572bab805824e779e17fff0453d418a422')

package() {
    local NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)
    npm install --global --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${NPM_FLAGS[@]}" "${srcdir}/${pkgname}-${pkgver}.tgz"
    chown -R root:root "${pkgdir}"
}
