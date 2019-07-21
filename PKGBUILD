# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=nvman
pkgver=2.0.1
pkgrel=1
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
sha256sums=(dd70174157a47d58310f7eea14248cdd32b6e37980dcbac578bfb0774e1d4557)

package() {
    cd "extras"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    mkdir -p "$pkgdir/etc/default/"

    install $pkgname "$pkgdir/usr/bin/"
    cp "$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
    cp "$pkgname.default" "$pkgdir/etc/default/nvman"
}
