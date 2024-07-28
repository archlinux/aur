# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=zig-zvm-bin
pkgver='0.4.5'
pkgrel='1'
pkgdesc='Fast and simple zig version manager'
arch=('x86_64')
url='https://github.com/hendriknielaender/zvm'
license=('MIT')
provides=("zvm" "zig-zvm")
conflicts=('zig-zvm' 'zvm' 'zig-zvm-git' 'zig')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hendriknielaender/zvm/releases/download/v$pkgver/$CARCH-linux-zvm.tar.gz" "LICENSE")
sha256sums=(
    'cbaec834bad402e77e27583b6d7bf8c61dede437261326cc71638b195814995a'
    'c37983c1c40639eef5330e8e5769a9107c3e260f946576f8464747b18048558f')

package() {
    cd $srcdir
    install -Dm755 $CARCH-linux-zvm "$pkgdir/usr/bin/zvm"
    ln -s "/usr/bin/zvm" "$pkgdir/usr/bin/zig"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
