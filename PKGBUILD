# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.96.0
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64' 'i686' 'aarch64')
url="https://www.rust-lang.org/"
license=('Apache-2.0 OR MIT')
options=('docs' '!strip' '!debug')
source_x86_64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"{,.asc})
source_i686=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-i686-unknown-linux-gnu.tar.gz"{,.asc})
source_aarch64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"{,.asc})
b2sums_x86_64=('05af2e754d78093da386ec3fca82ce756f29012e970d0e2da80c02a83f9433aa45b04167ae4abbe2edfb3d7ad5d42549f446ddf2cc49a713c432397a04b58470'
               'SKIP')
b2sums_i686=('0bd9a8e2f78ca7f4686f7bf5247f9cf7a1bd30c7a7de826e42b9efc2c0f6c93348a9833a1fa8328772dd93b0ac2e234de45feb1d8562c72af7302b30097f32f4'
             'SKIP')
b2sums_aarch64=('88337432352aaa316cb574d75d2e1954cddcf774661fb0b061ec1d8b3cb24122ba724ca8996a1169806d7cbe37abc2ac231fa1065091532529e2961e48b2f867'
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
