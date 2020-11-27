# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom-bin
pkgver=0.5.3
pkgrel=0
pkgdesc='A cross-platform graphical process/system monitor with a customizable interface and a multitude of features.'
provides=('bottom')
conflicts=('bottom')
arch=('x86_64')
url="https://github.com/ClementTsang/bottom"
license=(MIT)
source=(
    archive-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/bottom_x86_64-unknown-linux-gnu.tar.gz
    LICENSE::${url}/raw/${pkgver}/LICENSE
)
sha512sums=(
    '08fe633699bf1f2552e2fc184ea9b46631c423d766cc5ede466ad14b3904ced19431f27c758d5ca52a87554fe5cd84dc9cf53fd59301505987a4bb9215404026'
    SKIP
)

package() {
    install -Dm755 btm "$pkgdir"/usr/bin/btm
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm644 completion/_btm "$pkgdir/usr/share/zsh/site-functions/_btm"
    install -Dm644 completion/btm.bash "$pkgdir/usr/share/bash-completion/completions/btm"
    install -Dm644 completion/btm.fish "$pkgdir/usr/share/fish/vendor_completions.d/btm.fish"
}
