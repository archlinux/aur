pkgname=susshi-bin
pkgver=0.15.8
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
b2sums=(ef4b912e4fffd2f75ff21528cbbd57e7a5e5b965ac11b130ed46d76d18ac0dee153dcc2d10c10afa2cc106e5dbf99d7fddbd852be0967db4305d6a0cf94ce94d)
b2sums_x86_64=(fe01ccccaad3439433c36cb6f265e0f74259b5b766872ece943e633d1a1bbafc259400af1e482bfe74b2a7e3c2bfe0c732582cd15b58f5b4a97109a722550102)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "susshi-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    find "susshi-${pkgver}/docs/" -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/docs/{}" \;
    find "susshi-${pkgver}/examples/" -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/examples/{}" \;
}
