pkgname=kumono-bin
pkgver=0.65.8
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('6a3584fd69b88e2872569b65a0989cc0336936dabf6e862d35eee5b88d0a03d4')
sha256sums_x86_64=('c0b28981c0f07f9a47c69319585f85683ededdf5dcd5538d09d00fece04e54b7')
sha256sums_aarch64=('e589c7e300c7cc9cbeee5791f7f7e3713cff10a784e5b37d65ce4467578b991e')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
