# Maintainer: awowogei <hidden>
pkgname=open-bin
_pkgname=open
pkgver=0.1.1
pkgrel=1
pkgdesc="A simpler alternative to xdg-open and xdg-mime"
arch=('x86_64')
url="https://github.com/awowogei/open"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/releases/latest/download/x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"
    ./$_pkgname --version | awk '{print $NF}'
}

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/completions/bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "$srcdir/completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 "$srcdir/completions/zsh"  "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
