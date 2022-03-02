# Maintainer: Curve <curve.platin at gmail.com>
pkgname=nordic-kde-transparency-git
pkgver=1.9.0.r129.g6ce5346
pkgrel=1
pkgdesc="Theme for KDE Plasma 5 using the awesome Nord color pallete and transparency"
arch=(any)
url="https://github.com/Curve/Nordic"
license=(GPL3)
options=(!strip)
source=("git+${url}.git")
sha256sums=(SKIP)
makedepends=(git)
depends=('nordic-kde-git')
provides=("nordic-kde-transparency-git")

pkgver() {
    cd Nordic
    git describe --long --tags | sed 's/^[vV-]//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd Nordic/kde
    install -d "${pkgdir}"/usr/share
    mkdir -p "${pkgdir}"/usr/share/color-schemes
    cp -r colorschemes/* "${pkgdir}"/usr/share/color-schemes
}
