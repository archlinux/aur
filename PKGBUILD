pkgname=susshi-bin
pkgver=0.25.3
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
b2sums=(a71f671f1b9d3c8f345398a85b05b04092123fa1a65994c788d3c71c9f1fd628a4a996751d8e2b5f00935dd6ad6901c354bc35194d5ab6e7ce305baec663a618)
b2sums_x86_64=(5a42a9d18c3c8643cc1590765d670a4de4a3921d13a83e23c08abe8c13e634e89503054f9b9a0c5a94460778e3a1d77588d3f1da7509f26748cd47b12a5f75a9)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "susshi-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    (cd "susshi-${pkgver}" && find docs/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
    (cd "susshi-${pkgver}" && find examples/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
}
