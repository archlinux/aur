pkgname=kumono-bin
pkgver=0.61.2
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('5f843a840c509a8c3e438eaac89b1e594e12bcba60ae84e39ca32d5d0943dff2')
sha256sums_x86_64=('749cef1bb7cd9d97b03702c1b51ff161748093b0a70dcada3598d5d1ced32484')
sha256sums_aarch64=('37702f6125f34b93f515cde30d0fd2231a196a104c7659820a2587838ef06230')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
