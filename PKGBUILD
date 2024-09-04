# Maintainer: Katherine Jamison <axertheaxe@proton.me>

pkgname=desk-exec-bin
_pkgname=desk-exec
pkgver=0.1.5
pkgrel=1
pkgdesc="Execute programs defined in XDG desktop entries directly from the command line"
url="https://github.com/axertheaxe/desk-exec"
source_x86_64=("https://github.com/axertheaxe/desk-exec/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
license=("Unlicense")
arch=("x86_64")
provides=("desk-exec")
conflicts=("desk-exec")
sha256sums_x86_64=("8866465a0aea31b95765163ca3c7ed8537b4245fa787433fff6b787ff1f792d3")

package() {
    install -Dm755 "desk-exec" "$pkgdir/usr/bin/desk-exec"

    install -Dm644 "dist/desk-exec.bash" "$pkgdir/usr/share/bash-completion/completions/desk-exec"
    install -Dm644 "dist/_desk-exec" "$pkgdir/usr/share/zsh/site-functions/_desk-exec"
    install -Dm644 "dist/desk-exec.fish" "$pkgdir/usr/share/fish/vendor_completions.d/desk-exec.fish"
    install -Dm644 "dist/desk-exec.nu" "$pkgdir/usr/share/nu-completion/desk-exec.nu"
    install -Dm644 "dist/desk-exec.elv" "$pkgdir/usr/share/elvish/modules/completion/desk-exec.elv"

    install -Dm644 "dist/desk-exec.1" "$pkgdir/usr/share/man/man1/desk-exec.1"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

