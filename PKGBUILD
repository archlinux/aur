pkgname=kumono-bin
pkgver=0.66.3
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('7b53adb363a5ea9583a7984fbc6da1a2775f0556e62ae0d8278fe696f7908628')
sha256sums_x86_64=('b0255fe1b3b0e6d3a00e651250580ca35381d26ce21d6bd01adf7931961022c2')
sha256sums_aarch64=('c5cc0d58a1fa94fc076c61dd6899bf0a3c0ea7e55d8d896b13485fbeaf941907')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
