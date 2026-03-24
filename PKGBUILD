# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.94.0
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64' 'i686' 'aarch64')
url="https://www.rust-lang.org/"
license=('Apache-2.0 OR MIT')
options=('docs' '!strip' '!debug')
source_x86_64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"{,.asc})
source_i686=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-i686-unknown-linux-gnu.tar.gz"{,.asc})
source_aarch64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"{,.asc})
b2sums_x86_64=('40de61ac566f52feda00ecaaabf1c309f2affd3e55c2a74fa2d790e80830d2584dd96c697724b24124a2d672fec73a2161a3b16615fcf2994e041b19c60c4b1f'
               'SKIP')
b2sums_i686=('7bfd3c4d6e1d9a7512c306e935fc91f5ac1f611be7192f49ac6aa76bfd0c84e3fa6946da00a1bf35dd8894b583dbe0cadd060bf063e863e274b696b53b0dbb98'
             'SKIP')
b2sums_aarch64=('83510b22869c3fa678bd4e37debe9c11e9f708bdaeeca89015e34f78d5ce46be76cf36796c36a21cf87b6f3871edd51785d3e9a0b7631f53c6274d843419755d'
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
