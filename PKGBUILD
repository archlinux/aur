pkgname=kumono-bin
pkgver=0.60.2
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('121387eef3395f3cfb7b7fc22585500f8c54ff0d83f54904e916f7f327b0e921')
sha256sums_x86_64=('31c55196d5e7ced30aeaa1cbd754a69660fc9ca9a5e7e0d3fa83259e0304bd05')
sha256sums_aarch64=('d06ffea8d5eb0f1cbc90ea569e8e08b6d4ca64b82937030bccead08565b987a5')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
