# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: Dominik Braun <mail at dominikbraun dot io>

pkgname=timetrace-bin
_srcname=timetrace
pkgver=0.7.0
pkgrel=1
pkgdesc="A simple CLI for tracking your working time."
arch=("x86_64")
url="https://github.com/dominikbraun/timetrace"
license=("Apache")
source=("timetrace-$pkgver.tar.gz::https://github.com/dominikbraun/timetrace/releases/download/v$pkgver/timetrace-linux-amd64.tar.gz"
"https://github.com/dominikbraun/timetrace/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('3d8e2d80f12e29ef698abc07bcf037fd5e265da7fe128d563c700fc4c1e81743'
            'b6ff8dbb76025b0ef32c976513fb74591a5bb7c2d48fe1b3bb3c18fa0ccb95e1')

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
