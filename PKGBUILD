# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.93.0
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64' 'i686' 'aarch64')
url="https://www.rust-lang.org/"
license=('Apache-2.0 OR MIT')
options=('docs' '!strip' '!debug')
source_x86_64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"{,.asc})
source_i686=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-i686-unknown-linux-gnu.tar.gz"{,.asc})
source_aarch64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"{,.asc})
b2sums_x86_64=('8f9c87b26d3f53eb731b122a9afa1da537b714fd603d7aaeffd8b2e901e8f1ea38752c7e0a99cc210697ad9938c5f3a34dfcf850c57e1758b9c337449a646973'
               'SKIP')
b2sums_i686=('818afa109be6ba4156544e9d3c59c0cb6fdcc862e0b9858769caaf34d5c63e367059dce0ef439b9ea6f0621ce254e92a9f6a7d33f5975826f20a3dc3c3d462da'
             'SKIP')
b2sums_aarch64=('e0f877a64d085c2b623843921822ed59b471ca1f9bfd493c0e3457b0735bf8446be8aa65250d4887cc6dfebbc5ca552c610847a2f8ef6557643954faf8b757bd'
                'SKIP')
validpgpkeys=(
  108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE  # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>
)


package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r "${pkgname}/share/doc/rust/html" "${pkgdir}/usr/share/doc/${pkgname%-docs}"

    install -Dt "${pkgdir}"/usr/share/licenses/$pkgname -m644 COPYRIGHT LICENSE-MIT
}
