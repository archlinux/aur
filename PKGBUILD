# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: Dominik Braun <mail at dominikbraun dot io>

pkgname=timetrace-bin
_srcname=timetrace
pkgver=0.6.1
pkgrel=1
pkgdesc="A simple CLI for tracking your working time."
arch=("x86_64")
url="https://github.com/dominikbraun/timetrace"
license=("Apache")
source=("timetrace-$pkgver.tar.gz::https://github.com/dominikbraun/timetrace/releases/download/v$pkgver/timetrace-linux-amd64.tar.gz"
"https://github.com/dominikbraun/timetrace/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('7fea6cf91c76e2f10ca3d20f1483d87b1b7372822cd0b8031323c933f0238fa7'
            '2140c9884d1619c91bdc3f75b2b0c6f32fb962f0300deec9bce2ced41ffbbbb1')

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
