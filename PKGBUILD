# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>
# Contributor: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=pass-pqp
pkgver=1.0.0
pkgrel=1
pkgdesc='pass-compatible password store backed by PQP post-quantum crypto'
arch=('any')
url='https://github.com/ajdiaz/pass-pqp'
license=('MIT')
depends=('pqp-crypto' 'git')
optdepends=(
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'qrencode: generate QR codes for entries'
    'gpg: migrate a GPG-backed pass store (pass-pqp-migrate)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ajdiaz/pass-pqp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c33e9a7c687c1b7a479e892642afcdd60c89731e76e054a0619e2a644c276a0e')

package() {
    cd "$srcdir/pass-pqp-$pkgver"
    install -Dm755 "pass-pqp" "$pkgdir/usr/bin/pass-pqp"
    install -Dm755 "contrib/pass-pqp-migrate" "$pkgdir/usr/bin/pass-pqp-migrate"
    install -Dm644 "man/pass-pqp.1" "$pkgdir/usr/share/man/man1/pass-pqp.1"
    install -Dm644 "man/pass-pqp-migrate.1" "$pkgdir/usr/share/man/man1/pass-pqp-migrate.1"
    install -Dm644 "completions/pass-pqp.bash" "$pkgdir/usr/share/bash-completion/completions/pass-pqp"
    install -Dm644 "completions/pass-pqp.zsh" "$pkgdir/usr/share/zsh/site-functions/_pass-pqp"
    install -Dm644 "completions/pass-pqp.fish" "$pkgdir/usr/share/fish/vendor_completions.d/pass-pqp.fish"
}
sha256sums=('c33e9a7c687c1b7a479e892642afcdd60c89731e76e054a0619e2a644c276a0e')
