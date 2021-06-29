# Maintainer: Clement Tsang (xoronth) <cjhtsang@uwaterloo.ca>

pkgname=bottom-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='A cross-platform graphical process/system monitor with a customizable interface and a multitude of features.'
provides=('bottom')
conflicts=('bottom')
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/ClementTsang/bottom"
license=(MIT)

source=(LICENSE::${url}/raw/${pkgver}/LICENSE)
source_x86_64=(archive-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/bottom_x86_64-unknown-linux-gnu.tar.gz)
source_aarch64=(archive-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/bottom_aarch64-unknown-linux-gnu.tar.gz)
source_armv7h=(archive-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/bottom_armv7-unknown-linux-gnueabihf.tar.gz)

sha512sums=(SKIP)
sha512sums_x86_64=('bbea8a2884ca70f49c9de8aaad81ec26a4d91fc7b018a222b84ca7d8d1a7829321fb86984eb831c73124569a7e0b980c37519d264be96e08f82f85b772214697')
sha512sums_aarch64=('f3deeabc5d47cd3564160d8d862d817a539b4ac961f18f55cefa86b60cad7cdb9d84a18eb3045044f5c907ef5d76e5de0eee3d3586525232f46455fe5e04a9df')
sha512sums_armv7h=('f9542783ed6f36274b121086c55f7c0220640819f5b7ab385644f575a6673ce3fb21b4ec416ea876a8e59b7a96178508114a660cdfb6c88f64b51ff57a72aee5')


package() {
    install -Dm755 btm "$pkgdir"/usr/bin/btm
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm644 completion/_btm "$pkgdir/usr/share/zsh/site-functions/_btm"
    install -Dm644 completion/btm.bash "$pkgdir/usr/share/bash-completion/completions/btm"
    install -Dm644 completion/btm.fish "$pkgdir/usr/share/fish/vendor_completions.d/btm.fish"
}
