# Maintainer: QaidVoid <contact@qaidvoid.dev>
pkgname=soar-nightly-bin
pkgver=baffeff
pkgrel=0
pkgdesc="A fast, modern package manager for Static Binaries, Portable Formats (AppImage|AppBundle|FlatImage|Runimage) & More [Nightly Release]"
arch=('aarch64' 'x86_64')
url="https://soar.qaidvoid.dev"
license=('MIT')
provides=('soar')
conflicts=('soar' 'soar-bin')
options=(!strip)
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/pkgforge/soar/releases/download/nightly/soar-aarch64-linux.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/pkgforge/soar/releases/download/nightly/soar-x86_64-linux.tar.gz")
sha256sums_aarch64=('db9a7b8dcc04002cf5b6611cc404282db4567c970d4d9319ce170289c26d23bd')
sha256sums_x86_64=('7611d5379e324648b4e7e0d65df32d968b3d8ce532389a9bdd15f9ce4ee8dda8')

package() {
    install -Dm755 "$srcdir/release/soar" -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/release/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$srcdir/release/"{README.md,CHANGELOG.md} -t "$pkgdir/usr/share/doc/$pkgname"
}
