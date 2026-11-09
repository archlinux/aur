pkgname=susshi-bin
pkgver=0.25.4
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
b2sums=(7621c12926ad9eb43c681bd34ef0e5824daf19edc14040b6020e1952d942bdba93d3185197bf10c29b6ffb76edec07c722b3343c568f577eec695c26c5cee78e)
b2sums_x86_64=(8aecd5b00ba33450b51229897dc1645d387132ab21c27716be7a3eac6ab27e6cd877829cb81c23c84184307fffd9ac23923a7e505169d17298ffc90abe3688f0)

package() {
    install -Dm0755 "susshi-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/susshi"
    install -Dm0644 "susshi-${pkgver}/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "susshi-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    (cd "susshi-${pkgver}" && find docs/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
    (cd "susshi-${pkgver}" && find examples/ -type f -exec install -Dm0644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;)
}
