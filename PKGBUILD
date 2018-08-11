# Maintainer: Carmelo <carmelo at cock dot li>

pkgname=comptray-py3
pkgver=1.0.r0.g2762813
pkgrel=1
pkgdesc="Compton toggle for the tray(python3)"
arch=("any")
url="https://gitlab.com/carmelo_/comptray3"
license=("GPL")
depends=("python" "gtk3" "python-gobject" "python-psutil" "compton")
optdepends=("compton-conf: GUI configuration for Compton")
conflicts=("comptray")
source=("${pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
    cd ${pkgname}
    git describe  --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd ${pkgname}
    install -Dm 755 comptray ${pkgdir}/usr/bin/comptray
} 
