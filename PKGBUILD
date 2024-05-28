# Maintainer: Pierre Depaz <pierre@enframed.net>
pkgname=liquidsoap-prettier
pkgver=1.5.1
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
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=("SKIP")

package() {
    local NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)
    npm install --global --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${NPM_FLAGS[@]}" "${srcdir}/${pkgname}-${pkgver}.tgz"
    chown -R root:root "${pkgdir}"
}

