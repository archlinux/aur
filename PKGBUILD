# Maintainer: David Rosenstrauch <darose@darose.net>
pkgname=refind-theme-metro-git
pkgver=r31.d20d691
pkgrel=1
pkgdesc="A rEFInd theme based of Burg Metro"
arch=('any')
url="https://github.com/JohnTrentonCary/rEFInd-Metro"
license=('none')
depends=('refind-efi')
makedepends=('git')
source=('git+https://github.com/JohnTrentonCary/rEFInd-Metro.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/rEFInd-Metro"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    REFIND_HOME="${pkgdir}/boot/EFI/refind"

    mkdir -p "${REFIND_HOME}/themes/metro"
    cp -r ${srcdir}/rEFInd-Metro/* "${REFIND_HOME}/themes/metro/"
    chmod -R 644 "${REFIND_HOME}/themes/metro"

    echo 'Remember to add "include themes/metro/theme.conf" to your refind.conf file'
}
