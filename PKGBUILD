# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=patent-bin
_pkgname=patent
pkgver=0.3.0
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
sha256sums_x86_64=('beed7ebfe5659f8f0b8e7cd12b39b0bbf591730748083c47d86c4f93e136e6c6')
sha256sums_aarch64=('4f6daa9ca94ac8bfcbdcd66c4b3531f97802d02c40321eaafe6eae5dd0e884b0')

package() {
    cd "patent-$CARCH-unknown-linux-gnu"
    install -Dm0755 patent "$pkgdir/usr/bin/patent"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
