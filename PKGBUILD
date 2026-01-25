# Maintainer: Funami
pkgname=fend-bin
pkgver=1.5.8
pkgrel=1
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64' 'aarch64')
url="https://github.com/printfn/fend"
license=('MIT')
provides=('fend')
conflicts=('fend')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/printfn/fend/v$pkgver/LICENSE.md"
        "$pkgname-$pkgver-fend.1::https://github.com/printfn/fend/releases/download/v$pkgver/fend.1")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x86_64-gnu.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64-gnu.zip")
sha256sums=('d39a21ed70fb553856f6d7e74fee4332261069502ae32ab9ac13b49d147696f7'
            'a754f3908bfc3226646711cffcfa584337674655823815e03be9955c80bf8559')
sha256sums_x86_64=('c23b490e503cdb94e8398c6d5275874f80b51a2090311a9694eb3a791e1706e8')
sha256sums_aarch64=('ec745c759ab970c050e21ad08ce33b7e746256bede87f2e7f73db6ea61e74a00')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 "$pkgname-$pkgver-fend.1" "$pkgdir/usr/share/man/man1/fend.1"
}
