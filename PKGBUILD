pkgname=kumono-bin
pkgver=0.72.2
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('9e81e3422a8385e996f75d2ccd047c06e4f30707c76b5585acb9fdb99a4667c9')
sha256sums_x86_64=('19845c175be4219423a0e160dfc2e0eb24b1a214aaf68c0c4dd1d4effb6dc9dc')
sha256sums_aarch64=('3749cfd20318f5c91f472bcd286a4306515f91a9915b55fed748d21423aa4b3b')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
