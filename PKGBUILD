# Maintainer: devome <evinedeng@hotmail.com>
# Contributer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_pkgname=pgvecto.rs
_pg_mver=17
pkgname="${_pkgname}-bin"
pkgver=0.4.0
pkgrel=2
pkgdesc="Scalable, Low-latency and Hybrid-enabled Vector Search in Postgres. Revolutionize Vector Search, not Database."
arch=('x86_64' 'aarch64')
url="https://github.com/tensorchord/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('postgresql')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/vectors-pg${_pg_mver}_x86_64-unknown-linux-gnu_${pkgver}.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/vectors-pg${_pg_mver}_aarch64-unknown-linux-gnu_${pkgver}.zip")
sha256sums_x86_64=('7cb22249dde61e7da266280986f71f179b220a771385f2d9a2aa78fc02439386')
sha256sums_aarch64=('0c179799ee6bdae611da687e016e884c8155e16039813101eb4cf5236c90fd76')

package() {
    install -Dm755 vectors.so      -t "${pkgdir}$(pg_config --pkglibdir)"
    install -Dm644 *.sql *.control -t "${pkgdir}$(pg_config --sharedir)/extension"
}
