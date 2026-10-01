pkgname=susshi-bin
pkgver=0.23.1
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
b2sums=(41ca442439483479730b7d287e4caeedd7636b0cc2a0f47cf3498414a28ac6285749310870fb8cc84d2eb5309a8cef6698180f84d349400ed0e72eece3e002cd)
b2sums_x86_64=(ccb88c81eca5b9cfa0202ce47534959d5b53b645702b001e3934d5d397e4c8cc0480381ff4f662e5d36ab420a45e47ed48148a1cbc4cb20fc62db6625d335bb0)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "susshi-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    (cd "susshi-${pkgver}" && find docs/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
    (cd "susshi-${pkgver}" && find examples/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
}
