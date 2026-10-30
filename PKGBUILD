# Maintainer: Guru <anjanaya@gmail.com>
pkgname=squawk-bin
pkgver=2.71.0
pkgrel=1
pkgdesc="Linter for PostgreSQL, focused on migrations"
arch=('x86_64' 'aarch64')
url="https://squawkhq.com/"
license=('Apache-2.0 OR MIT')
provides=('squawk')
conflicts=('squawk' 'squawk-cli')
options=('!debug')
source=("LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/sbdchd/squawk/v${pkgver}/LICENSE-MIT"
        "LICENSE-APACHE-${pkgver}::https://raw.githubusercontent.com/sbdchd/squawk/v${pkgver}/LICENSE-APACHE")
source_x86_64=("squawk::https://github.com/sbdchd/squawk/releases/download/v${pkgver}/squawk-linux-musl-x64")
source_aarch64=("squawk::https://github.com/sbdchd/squawk/releases/download/v${pkgver}/squawk-linux-musl-arm64")
sha256sums=('23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3'
            'a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2')
sha256sums_x86_64=('cf542e159fb3a94e5fd31d8b5282a31334df8205c6d7993afe286e9133fdff3e')
sha256sums_aarch64=('cf542e159fb3a94e5fd31d8b5282a31334df8205c6d7993afe286e9133fdff3e')

package() {
    install -Dm755 "${srcdir}/squawk" "${pkgdir}/usr/bin/squawk"

    install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "${srcdir}/LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
