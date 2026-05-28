pkgname=susshi-bin
pkgver=0.15.14
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
b2sums=(01633bb024fce9eb8b73feb29bd05e4a6f21eb299099054ce4e257fc5ea7947e959fbad9bf2ed390f1521ec5272fb8e1baf0228cfc79522d3d6824e6a844a10a)
b2sums_x86_64=(309253c7b6570bbdcffa1a08e2adde02e2f44e31e56d07c5637e1a1b74e063ec13ecf8cfee22d67c013821f6494209e12eace12b57471eba231dc36aa9fd937e)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-amd64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "susshi-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    (cd "susshi-${pkgver}" && find docs/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
    (cd "susshi-${pkgver}" && find examples/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
}
