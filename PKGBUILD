pkgname=kumono-bin
pkgver=0.62.2
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('4f84dd9f2b48cd47220e36291006c14f0388a8823cb91799911f473e66239508')
sha256sums_x86_64=('c067822a177bee8b8ee5b91f346976dbf2cdfa3c8a2d2fe4469ad7c9f3cc5e6b')
sha256sums_aarch64=('9f1f7efa26665f667c065df42108ed2d5b80c3588f2dd01d9c48bafc0e1da381')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
