# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.100.0
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64' 'i686' 'aarch64')
url="https://www.rust-lang.org/"
license=('Apache-2.0 OR MIT')
options=('docs' '!strip' '!debug')
source_x86_64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"{,.asc})
source_i686=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-i686-unknown-linux-gnu.tar.gz"{,.asc})
source_aarch64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"{,.asc})
b2sums_x86_64=('502c4ec9d68ad2de202c42f56b40dca99e6881fc6c2199e47b3016eee4602b059a371bb9fb9e7e5a4092d65eb7af0e3bfa966ff25f3dcd26102e4bb24aa857e5'
               'SKIP')
b2sums_i686=('b0a7a725825fd826595af5e69cbdb5ae4ae35dbadfb38ff6c74ee6548b405fbc4a9614a8dafaeac282705816669fef85d9f130ba2837ee32311e49039467bc95'
             'SKIP')
b2sums_aarch64=('2d68b7e75e4cf5db4761227b0013fd5c638be4cdbe9b1b08598e30c75ff59f386923cfb20d5684ff7bfedfccd45254a58364434696d58a36dcf1f5892a367c63'
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
