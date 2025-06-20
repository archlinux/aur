pkgname=opencv-busto
pkgver=1.0.0
pkgrel=1
pkgdesc="Gesture detection app using MediaPipe and OpenCV with a GTK interface"
arch=('x86_64')
url="https://github.com/chrissolanilla/opencv-python-zoom"
license=('MIT')
depends=('gtk3' 'opencv' 'python')
makedepends=('pyinstaller' 'git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chrissolanilla/opencv-python-zoom/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r dist/app/* "$pkgdir/opt/$pkgname/"

    install -Dm755 dist/app/app "$pkgdir/usr/bin/$pkgname"
    ln -s /opt/$pkgname/app "$pkgdir/usr/bin/$pkgname"
}

