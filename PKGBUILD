pkgname=kumono-bin
pkgver=0.56.3
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('d6e3194974cc6ef948c36e6e78426f1f30b1917b78ffa2b90fa1dd49cb3227a5')
sha256sums_x86_64=('bd178718fc4b6d2e155f290c1f4f4e84d9bd476f2538dca3047aa2d2c74db346')
sha256sums_aarch64=('6212260466dec3008e1a407b4de54f0c4c6f18d9543df19028cfb92f071c5aaf')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
