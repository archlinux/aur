pkgname=susshi-bin
pkgver=0.18.3
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
b2sums=(860efda84de60e5cfe25eed6291ad172271a6d252bfab521e851b9f0f4d1bb5f89d60c1d22b711788f9687834d9c60a47092eab2bd1fcf4c71e3cbc004746ccf)
b2sums_x86_64=(e37cae594dbcc1f42c2a82f062e52c454cc76461969d973d2790deff18d02efc60161e76ec9df6a78daab70bef6b538891dedb1e06235657109355505d519a22)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "susshi-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    (cd "susshi-${pkgver}" && find docs/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
    (cd "susshi-${pkgver}" && find examples/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
}
