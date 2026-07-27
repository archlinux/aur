# Maintainer: spiriwind <ruiting_mail@qq.com>
pkgname=mimocode
pkgver=0.1.6
pkgrel=1
pkgdesc="AI-powered CLI coding agent by Xiaomi MiMo Team"
arch=('x86_64')
url="https://mimo.xiaomi.com/coder"
license=('MIT')
options=('!strip')
depends=('nodejs>=18')
optdepends=('sox: voice input support')
install="$pkgname.install"
# Official FDS source (same as https://mimo.xiaomi.com/install script)
source=("https://mimocode.cnbj1.mi-fds.com/mimocode/mimocode/releases/v${pkgver}/mimocode-linux-x64.tar.gz"
        "mimocode.bash"
        "mimocode.fish"
        "mimocode.1"
        "mimocode.zh_CN.1")
sha256sums=('SKIP'
           'SKIP'
           'SKIP'
           'SKIP'
           'SKIP')

package() {
    # Binary
    install -Dm755 "$srcdir/mimo" "$pkgdir/usr/bin/mimo"

    # Bash completion
    install -Dm644 "$srcdir/mimocode.bash" "$pkgdir/usr/share/bash-completion/completions/mimo"

    # Fish completion
    install -Dm644 "$srcdir/mimocode.fish" "$pkgdir/usr/share/fish/vendor_completions.d/mimo.fish"

    # Man pages
    install -Dm644 "$srcdir/mimocode.1" "$pkgdir/usr/share/man/man1/mimo.1"
    install -Dm644 "$srcdir/mimocode.zh_CN.1" "$pkgdir/usr/share/man/zh_CN/man1/mimo.1"
}
