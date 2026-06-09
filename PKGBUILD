# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=patent-bin
_pkgname=patent
pkgver=0.4.0
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
sha256sums_x86_64=('c5c5f8bc8b7748a3ff3eb48913104f64f9b444da65f8da411eda3c5bfde4363a')
sha256sums_aarch64=('dd1b1044ec96c4104d28283db7efe7cb58399deb13e5f5616da08a88343cce49')

package() {
    cd "patent-$CARCH-unknown-linux-gnu"
    install -Dm0755 patent "$pkgdir/usr/bin/patent"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
