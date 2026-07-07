# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=patent-bin
_pkgname=patent
pkgver=0.8.0
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
sha256sums_x86_64=('1ef170824bb65a7359da4172d537d4fe86dd93788ac25b87bdcb5c3b1b679e2f')
sha256sums_aarch64=('02f666b50f3fc3e84824357f113fb3152994f4ee390afbcbca85032772677a67')

package() {
    cd "patent-$CARCH-unknown-linux-gnu"
    install -Dm0755 patent "$pkgdir/usr/bin/patent"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
