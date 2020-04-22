# Maintainer: David Rosenstrauch <darose@darose.net>
pkgname=refind-theme-metro-git
pkgver=r47.40986b2
pkgrel=2
pkgdesc="A rEFInd theme based of Burg Metro"
arch=('any')
url="https://github.com/JohnTrentonCary/rEFInd-Metro"
license=('none')
depends=('refind')
makedepends=('git')
source=('git+https://github.com/JohnTrentonCary/rEFInd-Metro.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/rEFInd-Metro"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    REFIND_HOME="${pkgdir}/boot/EFI/refind"

    mkdir -p "${REFIND_HOME}/themes/rEFInd-Metro"
    cp -r ${srcdir}/rEFInd-Metro/* "${REFIND_HOME}/themes/rEFInd-Metro/"
    chmod -R 644 "${REFIND_HOME}/themes/rEFInd-Metro"

    echo 'Remember to add "include themes/rEFInd-Metro/theme.conf" to your refind.conf file'
}
