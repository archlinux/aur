# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=nvman
pkgver=2.0.1
pkgrel=2
pkgdesc="NVIDIA Manager for Optimus/Bumblebee"
arch=('any')
url=https://github.com/quebin31/nvman
license=('GPL')
depends=('bumblebee' 'primus' 'optimus-manager>=1.1')
optdepends=()
conflicts=()
options=()
install=$pkgname.install
source=("https://github.com/quebin31/${pkgname}/releases/download/${pkgver}/${pkgver}.tar.xz")
sha256sums=(b73770fddd964b2b7bfcf72ec68fdb7524e95a9908b7454e0bbee66c4513a189)

package() {
    cd "extras"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    mkdir -p "$pkgdir/etc/default/"

    install $pkgname "$pkgdir/usr/bin/"
    cp "$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
    cp "$pkgname.default" "$pkgdir/etc/default/nvman"
}
