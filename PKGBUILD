# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=nvman
pkgver=2.0.2
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
sha256sums=(6bc4289deb643bee9d53f4d8aa0553c191cfca0dba00a7ff9d73d481d424d7af)

package() {
    cd "extras"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    mkdir -p "$pkgdir/etc/default/"

    install $pkgname "$pkgdir/usr/bin/"
    cp "$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
    cp "$pkgname.default" "$pkgdir/etc/default/nvman"
}
