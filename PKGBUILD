# Maintainer: Andres Rodriguez <andresx7@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=gpu-trace
pkgver=2.11
pkgrel=1
pkgdesc="GPU Trace capture tool"
arch=('any')
url="https://github.com/lostgoat/gpu-trace"
license=('MIT')
depends=('python3' 'trace-cmd')
provides=('amdgpu-trace')
conflicts=('amdgpu-trace')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('08ebadb7f379b69570227480bc2bf3b0c180970869afe72b17b414d023dc7845')

package() {
    cd "$pkgname-$pkgver"
    install -dm755 "$pkgdir/usr/bin/"
    make INSTALL_ROOT="$pkgdir" INSTALL_PREFIX="/usr/" install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
