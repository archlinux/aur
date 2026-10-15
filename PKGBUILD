pkgname=susshi-bin
pkgver=0.25.0
pkgrel=1
pkgdesc='modern, terminal-based SSH connection manager (pre-built binary)'
url='https://github.com/yatoub/susshi'
license=('MIT')
depends=('openssh')
arch=('x86_64')
provides=('susshi')
conflicts=('susshi')
source=("https://github.com/yatoub/susshi/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("susshi-${pkgver}-linux-x86_64::https://github.com/yatoub/susshi/releases/download/v${pkgver}/susshi-linux-x86_64")
b2sums=(14081e62434ced2e1421d3233f58fcdb3ef2315c960986760ca405cf9472c60f9299c2bc8521f7cdd752b0f561d324d8b5768444c596f78e1b20d36b1db8c521)
b2sums_x86_64=(0c74056be9e9059d9c149d380d82074ec563868d7f38c23a174cc645820e68045e7e9ccc8b7217b6f06a5d7e856d70578e8a18d5503ab4607ac536a124c270d7)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "susshi-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    (cd "susshi-${pkgver}" && find docs/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
    (cd "susshi-${pkgver}" && find examples/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
}
