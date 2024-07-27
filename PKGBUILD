# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=zig-zvm-bin
pkgver='0.4.4'
pkgrel='1'
pkgdesc='Fast and simple zig version manager'
arch=('x86_64')
url='https://github.com/hendriknielaender/zvm'
license=('MIT')
provides=("zvm" "zig-zvm")
conflicts=('zig-zvm-bin' 'zvm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hendriknielaender/zvm/releases/download/v$pkgver/$CARCH-linux-zvm.tar.gz" "LICENSE")
sha256sums=(
    '4ce6c5aab807c1b5769c38f9ec1bf2b7c6cff9ab8e6895c671aa33e2f1023f68'
    'c37983c1c40639eef5330e8e5769a9107c3e260f946576f8464747b18048558f')

package() {
    cd $srcdir
    install -Dm755 $CARCH-linux-zvm "$pkgdir/usr/bin/zvm"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
