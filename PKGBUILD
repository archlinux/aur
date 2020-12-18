# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom-bin
pkgver=0.5.6
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
    '99ab00c422f3174052f1e4b465785246e5c645c6e1cc90afab08293c03bc9d70caca106702b60c405ecc2c366dfef28e6322b9885db7ca645b3984f3a4bcf0f6'
    SKIP
)

package() {
    install -Dm755 btm "$pkgdir"/usr/bin/btm
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm644 completion/_btm "$pkgdir/usr/share/zsh/site-functions/_btm"
    install -Dm644 completion/btm.bash "$pkgdir/usr/share/bash-completion/completions/btm"
    install -Dm644 completion/btm.fish "$pkgdir/usr/share/fish/vendor_completions.d/btm.fish"
}
