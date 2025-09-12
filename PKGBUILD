# Maintainer: notscripter <grx8x0mfy@mozmail.com>
pkgname=kotlin-debug-adapter-bin
pkgver=0.4.4
pkgrel=1
epoch=
pkgdesc="Kotlin/JVM debugging for any editor/IDE using the Debug Adapter Protocol"
arch=(x86_64)
url="https://github.com/fwcd/kotlin-debug-adapter"
license=('MIT License')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(kotlin-debug-adapter)
conflicts=(kotlin-debug-adapter)
replaces=()
backup=()
options=(!debug)
install=
changelog=
source_x86_64=(kotlin-debug-adapter-$pkgver-$pkgrel.zip::https://github.com/fwcd/kotlin-debug-adapter/releases/download/$pkgver/adapter.zip)
noextract=()
sha256sums_x86_64=(3874cbaded0fdb8229a381167895b0a6caf88b7adffabc690fcf5a6fb65d11b6)
validpgpkeys=()

package() {
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"

    cd ${srcdir}/adapter
    cp -ra ./lib ./bin "${pkgdir}/usr/share/${pkgname}"
    ln -s "/usr/share/${pkgname}/bin/kotlin-debug-adapter" "${pkgdir}/usr/bin/kotlin-debug-adapter"
}
