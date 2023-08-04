# Maintainer: BlackDragon2447 <blackdragon2447@e.email>
pkgname='leftwm-config-bin'
pkgver=0.1.0
pkgrel=1
pkgdesc="Config manager for LeftWM"
arch=('x86_64')
url="https://github.com/leftwm/leftwm-config"
license=('BSD')
depends=('leftwm')
provides=("leftwm-config")
conflicts=("leftwm-config")
source=("https://github.com/leftwm/leftwm-config/releases/download/0.1.0/leftwm-config" "LICENCE")
sha256sums=('035847a66b3073dad062597ffc896ef19605a93ec6505cc8cb60245914d32fae'
            'dfa43b4ea9901bda7a843a20c6ece1974dda037d3fa5248411b42d56f58a8726')
# sha256sums=("SKIP" "SKIP")

prepare() {
    chmod +x ./leftwm-config
}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" $srcdir/LICENCE
  install -Dm755 -t "${pkgdir}/usr/bin" $srcdir/leftwm-config
}
