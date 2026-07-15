# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=hygg-bin
_pkgname=hygg
pkgver=0.1.24
pkgrel=1
pkgdesc='Minimalistic Vim-like TUI document reader.'
arch=(
    'x86_64'
)
url='https://github.com/kruseio/hygg'
license=(
    'AGPL-3.0'
    'MIT'
)
makedepends=('cargo') # 'clang' 'gcc-libs')
options=(
    !lto
    !debug
    !strip
)
provides=(
    'hygg'
)
conflicts=($_pkgname-git $_pkgname)
source=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/${pkgver}/hygg-cli-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('1e195a41a0a0f87718faaa2c584dd414a20c7ac843f0477c8c53b209719e5e4f')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" hygg
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-AGPL"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
