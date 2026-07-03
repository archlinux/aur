# Maintainer: someoneonsmile <someoneonsmile@gmail.com>
pkgname=stow-cm-nightly-bin
conflicts=('stow-cm' 'stow-cm-bin')
provides=('stow-cm')
pkgver=20260703
pkgrel=1
pkgdesc="Config manager (gnu-stow like) — nightly build"
arch=('x86_64' 'aarch64')
url="https://github.com/someoneonsmile/stow-cm"
license=('GPL2')

_source_base="${url}/releases/download/nightly"

source_x86_64=("${_source_base}/stow-cm-x86_64-linux-gnu.tar.gz")
source_aarch64=("${_source_base}/stow-cm-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "$srcdir"
    tar xzf "stow-cm-${CARCH}-linux-gnu.tar.gz"
    install -Dm755 "stow-cm-${CARCH}-linux-gnu/stow-cm" "$pkgdir/usr/bin/stow-cm"
    install -Dm644 "stow-cm-${CARCH}-linux-gnu/complete/stow-cm.bash" "$pkgdir/usr/share/bash-completion/completions/stow-cm" 2>/dev/null || true
    install -Dm644 "stow-cm-${CARCH}-linux-gnu/complete/_stow-cm" "$pkgdir/usr/share/zsh/site-functions/_stow-cm" 2>/dev/null || true
    install -Dm644 "stow-cm-${CARCH}-linux-gnu/complete/stow-cm.fish" "$pkgdir/usr/share/fish/vendor_completions.d/stow-cm.fish" 2>/dev/null || true
    install -Dm644 "stow-cm-${CARCH}-linux-gnu/man/stow-cm.1" "$pkgdir/usr/share/man/man1/stow-cm.1" 2>/dev/null || true
}
