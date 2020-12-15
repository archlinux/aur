# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom-bin
pkgver=0.5.5
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
    'ed5a1b2102fd34af9dff6d243a1ae021a359f8e81542e70dd7ca28de2b6d09096e1c605fe438a6d480021baa478e1b56539c2100ac6b576114a432d0646cee63'
    SKIP
)

package() {
    install -Dm755 btm "$pkgdir"/usr/bin/btm
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm644 completion/_btm "$pkgdir/usr/share/zsh/site-functions/_btm"
    install -Dm644 completion/btm.bash "$pkgdir/usr/share/bash-completion/completions/btm"
    install -Dm644 completion/btm.fish "$pkgdir/usr/share/fish/vendor_completions.d/btm.fish"
}
