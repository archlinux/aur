# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: Dominik Braun <mail at dominikbraun dot io>

pkgname=timetrace-bin
_srcname=timetrace
pkgver=0.8.0
pkgrel=1
pkgdesc="A simple CLI for tracking your working time."
arch=("x86_64")
url="https://github.com/dominikbraun/timetrace"
license=("Apache")
source=("timetrace-$pkgver.tar.gz::https://github.com/dominikbraun/timetrace/releases/download/v$pkgver/timetrace-linux-amd64.tar.gz"
"https://github.com/dominikbraun/timetrace/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('a54295f85ca7c02b1a75cd8321d80a261dd4a416360b46f12bda17652e3d6cfd'
            '584d0348f9398faf8c21ccd702e7bc3c08782f6af881bf644aba36ca84ce2e92')

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
