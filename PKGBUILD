# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.85.1
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64' 'i686' 'aarch64')
url="https://www.rust-lang.org/"
license=('Apache-2.0' 'MIT')
options=('docs' '!strip' '!debug')
source_x86_64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-i686-unknown-linux-gnu.tar.gz")
source_aarch64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('aad335b53bfc6a926cab00b3033df70d6767452d9f1e99a6918256cf04836627')
sha256sums_i686=('0565458cfcb33a3bc9c885f0fbf463a132c428091306f28f4901449370cc3c50')
sha256sums_aarch64=('59b782e1e4939a655d87369b784475cd1d6bc8ace46b225bd9e88da20224bc20')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r "${pkgname}/share/doc/rust/html" "${pkgdir}/usr/share/doc/${pkgname%-docs}"

    install -Dm644 LICENSE-MIT "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-MIT
}
