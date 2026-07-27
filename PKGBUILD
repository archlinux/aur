# Maintainer: jo <matchless7198 at gmail dot com>
pkgname=openomen
pkgver=0.3.4
pkgrel=1
pkgdesc="Unofficial CLI, driver and daemon for managing HP Victus/OMEN laptops on Linux"
arch=('x86_64')
url="https://github.com/openomen/openomen"
license=('MIT')
depends=()
optdepends=()
source=("openomen-${pkgver}::https://github.com/openomen/openomen/releases/download/v${pkgver}/openomen"
        "openomen.bash"
        "openomen.fish"
        "openomen.1"
        "openomen.zh_CN.1")
sha256sums=('SKIP'
           'SKIP'
           'SKIP'
           'SKIP'
           'SKIP')
install="$pkgname.install"

package() {
    # Binary
    install -Dm755 "$srcdir/openomen-${pkgver}" "$pkgdir/usr/bin/openomen"

    # Bash completion
    install -Dm644 "$srcdir/openomen.bash" "$pkgdir/usr/share/bash-completion/completions/openomen"

    # Fish completion
    install -Dm644 "$srcdir/openomen.fish" "$pkgdir/usr/share/fish/vendor_completions.d/openomen.fish"

    # Man pages
    install -Dm644 "$srcdir/openomen.1" "$pkgdir/usr/share/man/man1/openomen.1"
    install -Dm644 "$srcdir/openomen.zh_CN.1" "$pkgdir/usr/share/man/zh_CN/man1/openomen.1"
}
