# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex-bin
pkgver=4.4
pkgrel=1
pkgdesc="A command line tool for browsing Hacker News in your terminal. Pre-compiled."
arch=('i686' 'pentium4' 'x86_64' 'aarch64')
url="https://github.com/bensadeh/circumflex"
license=('custom')
depends=('glibc')
provides=('circumflex')
conflicts=('circumflex')
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_386.tar.gz")
source_pentium4=("$pkgname-$pkgver-pentium4.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_386.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/circumflex_${pkgver}_Linux_arm64.tar.gz")

sha256sums_i686=('50b73959cbdb6e2e49e06b341c2e2042bd33f3fed33ca0e3de8809b20ecc6f62')
sha256sums_pentium4=('50b73959cbdb6e2e49e06b341c2e2042bd33f3fed33ca0e3de8809b20ecc6f62')
sha256sums_x86_64=('102024185ae9c205c8941d1fbfff9ea52731ea2975d24c5b1b81c0cde8df9bc4')
sha256sums_aarch64=('8cd2d7ce33a49fc3973cdba2b4276d4e889e552d673c59cbe7191244d0f1e32c')

package() {
    cd "$srcdir"

    install -Dm755 clx "$pkgdir/usr/bin/clx"
    install -Dm644 share/man/clx.1 "$pkgdir/usr/share/man/man1/clx.1"
    install -Dm644 share/completions/clx.bash \
        "$pkgdir/usr/share/bash-completion/completions/clx"
    install -Dm644 share/completions/_clx \
        "$pkgdir/usr/share/zsh/site-functions/_clx"
    install -Dm644 share/completions/clx.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/clx.fish"
}
