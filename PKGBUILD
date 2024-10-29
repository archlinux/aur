# Maintainer: Saghm Rossi <aur@saghm.com>
pkgname=marmite
pkgver=0.1.7
pkgrel=1
pkgdesc="Markdown makes sites - A Static Site Generator for Blogs "
arch=('x86_64')
url="https://rochacbruno.github.io/marmite/"
source=("marmite-$pkgver.tar.gz::https://github.com/rochacbruno/marmite/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('085aec23062f4e1024ff36a18e2343d325b1fd9ea13e8ff69db9d742db789e7f35750fc79e09ef49f54904f4d254bf5cf24a1ccefc3da4d7979b41e600fbdf09')

build() {
    cd "${srcdir}/marmite-${pkgver}"
    cargo build --release
}

package() {
    cd "${srcdir}/marmite-${pkgver}"
    install -Dm755 "target/release/marmite" "${pkgdir}/usr/bin/marmite"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/marmite/LICENSE"

}
