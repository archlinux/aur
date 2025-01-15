# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.84.0
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64' 'i686' 'aarch64')
url="https://www.rust-lang.org/"
license=('Apache-2.0' 'MIT')
options=('docs' '!strip' '!debug')
source_x86_64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-i686-unknown-linux-gnu.tar.gz")
source_aarch64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('22d9881458e0f2d60b44b2e882f4eaf37488769d82dffa49d2173889c822e52b')
sha256sums_i686=('dc61f6efc50c3660ae93a8d4f3f76dd09d5dc3427a12c3cee5191c9f31eafbee')
sha256sums_aarch64=('a5a000a67120089bf43e289ba088ae0a9bc41796b89413ea54c7e7131a72c921')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r "${pkgname}/share/doc/rust/html" "${pkgdir}/usr/share/doc/${pkgname%-docs}"

    install -Dm644 LICENSE-MIT "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-MIT
}
