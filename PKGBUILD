# Maintainer: Saghm Rossi <aur@saghm.com>
pkgname=marmite
pkgver=0.2.3
pkgrel=1
pkgdesc="Markdown makes sites - A Static Site Generator for Blogs "
arch=('x86_64')
url="https://rochacbruno.github.io/marmite/"
source=("marmite-$pkgver.tar.gz::https://github.com/rochacbruno/marmite/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('436b11b8bf674804c51652bfce935fc18fcfd9528be6eb5530474faae6b5175dfd40b34d3d2bf6c08a503bb4894d2a185f583cf609e4b649226b240404f4dadc')

build() {
    cd "${srcdir}/marmite-${pkgver}"
    cargo build --release
}

package() {
    cd "${srcdir}/marmite-${pkgver}"
    install -Dm755 "target/release/marmite" "${pkgdir}/usr/bin/marmite"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/marmite/LICENSE"

}
