# Maintainer: Ash <xash at riseup d0t net>
# Former Maintainer: Pierre Depaz <pierre@enframed.net>
pkgname=liquidsoap-prettier
pkgver=1.6.0
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
noextract=("${_pkgname}-${pkgver}.tgz")
provides=("liquidsoap-prettier")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('b80427ef97621c2b7e28de9438be8942bf5e24bff579839770041c443b3926c5')

package() {
    local NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)
    npm install --global --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${NPM_FLAGS[@]}" "${srcdir}/${pkgname}-${pkgver}.tgz"
    chown -R root:root "${pkgdir}"
}

