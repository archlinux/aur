pkgname=kumono-bin
pkgver=0.65.5
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('7eb33026a2c810e40d8d9102ebd89ffea55dbf5f7e7403a148d623de1c7bf1f0')
sha256sums_x86_64=('276d21ad68bcbd65ab2865098b20421eff2ee69442fddcb6c66f3850fa8bf6c8')
sha256sums_aarch64=('a73f0232ef4d6863818bff0cf8bae1463d7c0091391f726e299a15693a852219')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
