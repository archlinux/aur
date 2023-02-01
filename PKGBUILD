# Maintainer: 5amu <v.casalino@protonmail.com>
pkgname=zeus-scanner
pkgver=0.3
pkgrel=1
pkgdesc="Powerful and Fast automated local vulnerability scanner over a remote connection"
arch=( 'x86_64' )
url="https://github.com/5amu/zeus"
license=( 'GPL3' )
provides=( 'zeus' )
source=("$pkgname.zip::${url}/releases/download/v${pkgver}/zeus_linux_amd64.zip")
sha256sums=('SKIP')

package() {
        mkdir -p "$pkgdir/usr/bin/"
        install -Dm 755 "$srcdir/zeus" "$pkgdir/usr/bin/zeus"

        [ -f "$srcdir/LICENSE" ] && mkdir -p "$pkgdir/usr/share/$pkgname/" && install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/$pkgname/LICENSE" || true
}
