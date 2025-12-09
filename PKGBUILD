# Maintainer: ZykaJiri <your-email@example.com>
pkgname=screen-record-cava
pkgver=1.1.0
pkgrel=1
pkgdesc="Screen recorder with real-time cava audio visualization"
arch=('any')
url="https://github.com/ZykaJiri/screen-record-cava"
license=('MIT')
depends=('gpu-screen-recorder' 'cava' 'bash')
optdepends=('pulseaudio: audio backend'
            'pipewire-pulse: alternative audio backend')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ZykaJiri/screen-record-cava/archive/refs/heads/master.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-master"
    install -Dm755 screen-record-cava "$pkgdir/usr/bin/screen-record-cava"
    ln -s screen-record-cava "$pkgdir/usr/bin/record"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

