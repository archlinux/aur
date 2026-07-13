# Maintainer: Max Martin <max at maxjmartin dot com>

pkgname=circumflex-bin
pkgver=4.5
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

sha256sums_i686=('8a115919c9fe9cfd8858656920254830a67382470ec6880af8d26f63f52fb7ca')
sha256sums_pentium4=('8a115919c9fe9cfd8858656920254830a67382470ec6880af8d26f63f52fb7ca')
sha256sums_x86_64=('5c290966b5e4cbdb59d2ea7547695b5301da2e424408b76678acc8debaa106d5')
sha256sums_aarch64=('56fb173ad650a3b89f4e47d055c50c3015eacb6c03d67b62df570757b5ce7bd9')

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
