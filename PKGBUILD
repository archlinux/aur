# Maintainer: Pratik Pingale <pratikbpingale9075@gmail.com>
pkgname=boo-sddm-git
pkgver=r33.3377e4c
pkgrel=2
pkgdesc="A dark SDDM theme based on Corners"
arch=('any')
url="https://github.com/PROxZIMA/boo-sddm"
license=('GPL3')
depends=('sddm' 'qt5-graphicaleffects' 'qt5-svg' 'qt5-quickcontrols2')
makedepends=()
provides=("${pkgname}")
conflicts=()
source=('git+https://github.com/PROxZIMA/boo-sddm.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/boo-sddm"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/boo-sddm"
    mkdir -p "${pkgdir}/usr/share/sddm/themes/"
    cp -r boo "${pkgdir}/usr/share/sddm/themes/"

    mkdir -p "${pkgdir}/usr/local/share/fonts/"
    cp boo/ChalKDust.ttf "${pkgdir}/usr/local/share/fonts/"
}
