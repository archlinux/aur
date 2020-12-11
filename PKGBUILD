# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom-bin
pkgver=0.5.4
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
    '218c8256f89ff8844039baa46880489fa215913ad388e0c60d03c681902a539f09fa6ec7a7051daf6ef26aee6a36b6e9651afdacfc913b4013b412528c22037c'
    SKIP
)

package() {
    install -Dm755 btm "$pkgdir"/usr/bin/btm
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm644 completion/_btm "$pkgdir/usr/share/zsh/site-functions/_btm"
    install -Dm644 completion/btm.bash "$pkgdir/usr/share/bash-completion/completions/btm"
    install -Dm644 completion/btm.fish "$pkgdir/usr/share/fish/vendor_completions.d/btm.fish"
}
