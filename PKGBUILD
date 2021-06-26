# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom-bin
pkgver=0.6.2
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
    'bbea8a2884ca70f49c9de8aaad81ec26a4d91fc7b018a222b84ca7d8d1a7829321fb86984eb831c73124569a7e0b980c37519d264be96e08f82f85b772214697'
    SKIP
)

package() {
    install -Dm755 btm "$pkgdir"/usr/bin/btm
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm644 completion/_btm "$pkgdir/usr/share/zsh/site-functions/_btm"
    install -Dm644 completion/btm.bash "$pkgdir/usr/share/bash-completion/completions/btm"
    install -Dm644 completion/btm.fish "$pkgdir/usr/share/fish/vendor_completions.d/btm.fish"
}
