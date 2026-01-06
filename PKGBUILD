pkgname=kumono-bin
pkgver=0.58.1
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('4b2ec17e484f02f93f1a9d2da5cbc80436ea8f412c97c573a25704297fa2c1a6')
sha256sums_x86_64=('b0f09b7aab5e99c11ee9c8753c22536be7af75ff0439b5d49dfff2ab72ba1c33')
sha256sums_aarch64=('343e92e2298392c91160fc521294e796f27471b6c4229229a043f5ca9961eec0')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
