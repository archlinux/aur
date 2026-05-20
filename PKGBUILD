pkgname=susshi-bin
pkgver=0.15.7
pkgrel=1
pkgdesc='modern, terminal-based SSH connection manager (pre-built binary)'
url='https://github.com/yatoub/susshi'
license=('MIT')
depends=('openssh')
arch=('x86_64')
provides=('susshi')
conflicts=('susshi')
source=("https://github.com/yatoub/susshi/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("susshi-${pkgver}-linux-amd64::https://github.com/yatoub/susshi/releases/download/v${pkgver}/susshi-linux-amd64")
b2sums=(e9db017e01429bb60deabee843819dd5de76d23d2e9845c7de1d65ca8ccbad693eb2c31c522ba5016043b42444c8036f23bafbbdb0d994290f4120560595b238)
b2sums_x86_64=(c2892a7a679f64d4f6d31f957ef74b44fcf7bea09924dedd484dedaab819d99fb576b816a7d7eef66b7e2e03f432e9640a68f78674047ceea4bdb1544d0871c5)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "susshi-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    find "susshi-${pkgver}/docs/" -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/docs/{}" \;
    find "susshi-${pkgver}/examples/" -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/examples/{}" \;
}
