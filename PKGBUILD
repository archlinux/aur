# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.78.0
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64' 'i686' 'aarch64')
url="https://www.rust-lang.org/"
license=('Apache-2.0' 'MIT')
options=('docs' '!strip' '!debug')
source_x86_64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-i686-unknown-linux-gnu.tar.gz")
source_aarch64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ddd1917e2c07d1d67e10c81617b5bfa7cec37c6f6a72d1007a99b947b44a1b5b')
sha256sums_i686=('d32dab9e5cb367f6062f23e1336c9f1f2fc0ab7029e194fac2ac227182d41870')
sha256sums_aarch64=('9e6a312aebdbf1427566dfba97c6dd01ac8935ea8cd921b967631fcac90b79c7')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r "${pkgname}/share/doc/rust/html" "${pkgdir}/usr/share/doc/${pkgname%-docs}"

    install -Dm644 LICENSE-MIT "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-MIT
}
