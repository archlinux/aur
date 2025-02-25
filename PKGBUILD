# Maintainer: Saghm Rossi <aur@saghm.com>
pkgname=marmite
pkgver=0.2.5
pkgrel=1
pkgdesc="Markdown makes sites - A Static Site Generator for Blogs "
arch=('x86_64')
url="https://rochacbruno.github.io/marmite/"
source=("marmite-$pkgver.tar.gz::https://github.com/rochacbruno/marmite/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('2890cc837df6e88010b6a9e8e9e96bf844e707f1cf84bd0efc5dab570cbef9708f50bf7f38ab7c08b8f85af5d42b6fcc0031f96ece8295885290de9e3eaff920')

build() {
    cd "${srcdir}/marmite-${pkgver}"
    cargo build --release
}

package() {
    cd "${srcdir}/marmite-${pkgver}"
    install -Dm755 "target/release/marmite" "${pkgdir}/usr/bin/marmite"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/marmite/LICENSE"

}
