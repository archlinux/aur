# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=hr-rust
pkgver=1.0.0
pkgrel=1
pkgdesc="hr in rust"
arch=("i686" "x86_64")
url="https://github.com/djmattyg007/hr-rust"
license=('custom:Public Domain')
source=("https://github.com/djmattyg007/hr-rust/archive/${pkgver}.tar.gz")
sha512sums=("84a908201fd4903f1549663187252a1f438ed1db6148fb938184d4b87b6a87fd80d8d9669f985fdc9aeaac5ccdb9a01a4086f6541a4f46b589faf970119027dd")
makedepends=("cargo")
conflicts=("hr")
provides=("hr")

package() {
    cd "${srcdir}/hr-rust-${pkgver}"
    cargo install --no-track --locked --all-features --root "${pkgdir}/usr/" --path .
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/hr-rust/LICENSE.txt"
}
