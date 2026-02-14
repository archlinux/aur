pkgname=kumono-bin
pkgver=0.71.0
pkgrel=1
pkgdesc='Media ripper for coomer and kemono'
url='https://github.com/APT37/kumono'
arch=('x86_64' 'aarch64')
license=('MIT-0')
source=("kumono-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source_x86_64=("kumono-$pkgver-x86_64::$url/releases/download/$pkgver/kumono-linux-x64")
source_aarch64=("kumono-$pkgver-aarch64::$url/releases/download/$pkgver/kumono-linux-arm64")
sha256sums=('8ca5ebf56e1d2cac1dbbf1ad888f5abca939360e99bd1aacb34627cf0bda4d92')
sha256sums_x86_64=('498d90aeb3027ac0304b506b10d4a6a933dc07ec970e0a1f9c50474d21dba01f')
sha256sums_aarch64=('83969dfa86be1a5fb0e7f3e361f01afacb91e8049821b5fcf71697fce17fe3a5')
options=('!lto')
provides=('kumono')
conflicts=('kumono' 'kumono-git')

package() {
    install -Dm755 "kumono-$pkgver-$arch" "$pkgdir/usr/bin/kumono"
    install -Dm644 "kumono-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "kumono-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
