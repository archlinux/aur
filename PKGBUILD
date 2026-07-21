

pkgname=badapple-py
pkgver=1.0.0
pkgrel=1
pkgdesc="ASCII Bad Apple player for Linux terminals written in Python"
arch=('any')
url="https://github.com/Raj-1727/badapple-py"
license=('MIT')

depends=(
    'python'
    'python-pillow'
    'ffmpeg'
    'figlet'
    'lolcat'
)


source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "badapple.mp4"
)

sha256sums=('SKIP' 'SKIP')



package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 badapple-py \
        "$pkgdir/usr/bin/badapple-py"

    install -Dm644 \
        "$srcdir/badapple.mp4" \
        "$pkgdir/usr/share/badapple-py/badapple.mp4"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
