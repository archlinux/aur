# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>
pkgname=refind-theme-minimal-git
pkgver=r56.4a6dd29
pkgrel=1
pkgdesc="A clean and minimal rEFInd theme"
arch=('any')
url="https://github.com/EvanPurkhiser/rEFInd-minimal"
license=('mit')
depends=('refind-efi')
makedepends=('git')
source=('git+https://github.com/EvanPurkhiser/rEFInd-minimal.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/rEFInd-minimal"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    REFIND_HOME="${pkgdir}/boot/EFI/refind"

    mkdir -p "${REFIND_HOME}/themes/rEFInd-minimal"
    cp -r ${srcdir}/rEFInd-minimal/* "${REFIND_HOME}/themes/rEFInd-minimal/"
    chmod -R 644 "${REFIND_HOME}/themes/rEFInd-minimal"

    echo 'Remember to add "include themes/rEFInd-minimal/theme.conf" to your refind.conf file'
}
