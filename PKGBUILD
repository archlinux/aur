# Maintainer: Matthew Gamble

pkgname=g
pkgver=0.5.4
pkgrel=1
pkgdesc="Stress-free wrapper around grep, using f."
arch=('any')
url='https://github.com/knu/g'
license=('BSD-2-Clause')
depends=('bash' 'f')
source=("https://github.com/knu/g/archive/v${pkgver}.tar.gz")
sha256sums=('8d01159f45fed02c6f06ecc10f37b8f818c63db4ed3da15e19e26eb029b36938')

package() {
    cd "g-$pkgver"
    install -Dm755 g "${pkgdir}/usr/bin/g"
    mkdir -p "${pkgdir}/usr/share/licenses/g"
    sed -n 5,28p g | sed -e 's/^..//' | sed -e 's/^#//' > "${pkgdir}/usr/share/licenses/g/LICENSE"
}
