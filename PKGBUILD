# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=patent-bin
_pkgname=patent
pkgver=0.6.0
pkgrel=1
pkgdesc='A prior-art search for your code ideas. Stop building what already exists.'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/r14dd/patent'
license=(
    'Apache-2.0'
    'MIT'
)
optdepends=(
    'ollama: powers the LLM verdict'
)
makedepends=(
    'cargo'
    'openssl'
    'gcc'
)
options=(
    !lto
    !debug
)
provides=('patent')
conflicts=('patent-git' 'patent')
source=('patent.install')
source_x86_64=("patent-bin-$pkgver.tar.xz::$url/releases/download/v$pkgver/patent-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("patent-bin-$pkgver.tar.xz::$url/releases/download/v$pkgver/patent-aarch64-unknown-linux-gnu.tar.xz")
install=patent.install
sha256sums=('24dff75c38b578cb7e8057366a764cb4313078f16bada568baf79ecde5cb49af')
sha256sums_x86_64=('595189c24e8cb414ad34383cc5a6f88f7fd4aa234f8fcfc5049e88ab44238e84')
sha256sums_aarch64=('65cb378f7b6dccc762b7ccdb5c4ecfe045601d914e44c68048075950cb9fd2cd')

package() {
    cd "patent-$CARCH-unknown-linux-gnu"
    install -Dm0755 patent "$pkgdir/usr/bin/patent"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
