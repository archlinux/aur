# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=patent-bin
_pkgname=patent
pkgver=0.14.0
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
sha256sums_x86_64=('375c20f9f552571bcc85df944c6cf5d3165034bec9f8a3a63de992211c88e4ea')
sha256sums_aarch64=('6e6b90cc6c460cb43ffcc1aaf876700bc86f3ab3b4da1c7ffb3f9c8e96ae76a4')

package() {
    cd "patent-$CARCH-unknown-linux-gnu"
    install -Dm0755 patent "$pkgdir/usr/bin/patent"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
