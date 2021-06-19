# Maintainer: David Li <davidtianli@gmail.com>
pkgname=pax-mc
pkgver=1.3.0
pkgrel=1
pkgdesc="The MC modpack manager for professionals."
arch=('any')
url="https://github.com/froehlicha/pax"
license=('MIT')
makedepends=('git' 'nim' 'nimble')
provides=('pax-mc')
conflicts=('pax-mc-bin' 'pax-mc-git')
replaces=()
changelog=
source=("pax-${pkgver}.tar.gz::https://github.com/froehlichA/pax/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('d7448af105647704313af13f35c2ca6a76b5df88fae63c27a03f40844c7a868C')

build() {
    cd "${srcdir}/pax-v.${pkgver}"
    echo "y" | nimble build
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/pax-v.${pkgver}/pax" "${pkgdir}/usr/bin/pax"
}
