# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: Dominik Braun <mail at dominikbraun dot io>

pkgname=timetrace-bin
_srcname=timetrace
pkgver=0.11.1
pkgrel=1
pkgdesc="A simple CLI for tracking your working time."
arch=("x86_64")
url="https://github.com/dominikbraun/timetrace"
license=("Apache")
source=("timetrace-$pkgver.tar.gz::https://github.com/dominikbraun/timetrace/releases/download/v$pkgver/timetrace-linux-amd64.tar.gz"
"https://github.com/dominikbraun/timetrace/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('20ec1741ad219cb81577d8038cd37ea9d4d82599d32cff7167e87e2d36a98a1f'
            'be58e352fd393659b3a22d057ecb31bd7a752c23f250273bf099d98ed7306a35')

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
