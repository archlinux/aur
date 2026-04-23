# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=rust-docs
epoch=1
pkgver=1.95.0
pkgrel=1
pkgdesc="Rust documentations."
arch=('x86_64' 'i686' 'aarch64')
url="https://www.rust-lang.org/"
license=('Apache-2.0 OR MIT')
options=('docs' '!strip' '!debug')
source_x86_64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"{,.asc})
source_i686=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-i686-unknown-linux-gnu.tar.gz"{,.asc})
source_aarch64=("https://static.rust-lang.org/dist/rust-docs-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"{,.asc})
b2sums_x86_64=('b54e0928b535b6a54da7c469085b68967faa4f38fc8d2535d9b6e69542d05d5ad9c48cfc0eec226150d59122c7b731bbe9823ac2e430b64c1ad1ad0eb123f496'
               'SKIP')
b2sums_i686=('18c93d238127301660a67efc8b59848e0e32ea2944a23373e1cc531dbab309a9e138fdf3fd898d7e7f519b89e4badeabbd9e08c4589884c481fa7fc0f3a6ad41'
             'SKIP')
b2sums_aarch64=('a5543a837cfd722f1c40b7862ebee8537346183744731dc19250a0cf1d2b098cf7ef2c409297382a7a31e23adbf570dc887861633a953787046d7999aa83a617'
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
