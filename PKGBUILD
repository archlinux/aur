# Maintainer: Pratik Pingale <pratikbpingale9075@gmail.com>
pkgname=proxzima-plymouth-git
pkgver=r1.b6e335a
pkgrel=1
pkgdesc="A techno Plymouth theme with crazy ass animation"
arch=('any')
url="https://github.com/PROxZIMA/proxzima-plymouth"
license=('GPL3')
depends=('plymouth')
makedepends=()
provides=("${pkgname}")
conflicts=()
source=('git+https://github.com/PROxZIMA/proxzima-plymouth.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/proxzima-plymouth"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/proxzima-plymouth"
    mkdir -p "${pkgdir}/usr/share/plymouth/themes/"
    cp -r proxzima "${pkgdir}/usr/share/plymouth/themes/"
}
