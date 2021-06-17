# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: Dominik Braun <mail at dominikbraun dot io>

pkgname=timetrace-bin
_srcname=timetrace
pkgver=0.10.0
pkgrel=1
pkgdesc="A simple CLI for tracking your working time."
arch=("x86_64")
url="https://github.com/dominikbraun/timetrace"
license=("Apache")
source=("timetrace-$pkgver.tar.gz::https://github.com/dominikbraun/timetrace/releases/download/v$pkgver/timetrace-linux-amd64.tar.gz"
"https://github.com/dominikbraun/timetrace/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('63395d6386bb3807740ab4ef54cabae8896a71499f157dcd9c83a83ec42e6107'
            'b2e29318e6c4cd4b2d062bc03ebb1731f57b4dec4b3336bb18047ddd4f5f6ad1')

conflicts=('timetrace')
depends=('glibc')
optdepends=('bash-completion')

package() {
    install -Dm 755 "$srcdir/$_srcname" -t "$pkgdir/usr/bin"

    cd "$_srcname-$pkgver"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

    install -Dm 755 "completion/bash/timetrace.sh" \
        "$pkgdir/usr/share/bash-completion/completions/timetrace"
}
