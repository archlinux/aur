# Maintainer: JinZhongjia <mail @ nvimer.org>

pkgname='zig-zvm'
pkgver='0.4.4'
pkgrel='3'
pkgdesc='Fast and simple zig version manager'
arch=('x86_64')
url='https://github.com/hendriknielaender/zvm'
license=('MIT')
makedepends=('zig' 'git')
conflicts=('zig-zvm-bin' 'zvm')
source=("git+https://github.com/hendriknielaender/zvm.git#tag=v${pkgver}")

md5sums=('SKIP')

build() {
    cd "$srcdir/zvm"
    zig build release
}

package() {
    cd "$srcdir/zvm"
    install -Dm755 zig-out/$CARCH-linux-zvm "$pkgdir/usr/bin/zvm"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
