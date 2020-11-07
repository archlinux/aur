# Maintainer: Jan Sonntag <jaso35 at googlemail dot com>
pkgname=refind-theme-matrix-git
pkgver=r19.91e3823
pkgrel=1
pkgdesc="Matrix-inspired rEFInd theme depicting Morpheus offering two choices"
arch=('any')
url="https://github.com/Yannis4444/Matrix-rEFInd"
license=('MIT')
depends=('refind')
makedepends=('git')
backup=(boot/EFI/refind/themes/Matrix-rEFInd/theme.conf)
source=('git+https://github.com/Yannis4444/Matrix-rEFInd.git')
install=refind-theme-matrix.install
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/Matrix-rEFInd"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    _refind_home="${pkgdir}/boot/EFI/refind"

    mkdir -p "$_refind_home"/themes/Matrix-rEFInd
    cp -r "$srcdir"/Matrix-rEFInd/* "$_refind_home"/themes/Matrix-rEFInd/
    rm "$_refind_home"/themes/Matrix-rEFInd/{preview.jpg,README.md,LICENSE.md}
    chmod -R 644 "$_refind_home"/themes/Matrix-rEFInd/
}
