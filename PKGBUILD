# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=fiji-plugin-multistackreg-bin
pkgver=1.45
pkgrel=1
pkgdesc='MultiStackReg plugin for Fiji (JAR distribution)'
arch=(any)
url='http://bradbusse.net/sciencedownloads.html'
license=('unknown')
# Both fiji-bin and fiji-binary exist in the AUR, but fiji-bin seems more
# up-to-date. They don't have a common provides= we could depend on here.
depends=('fiji-bin')
makedepends=()
_jar_fname="MultiStackReg${pkgver}_.jar"
source=("http://bradbusse.net/$_jar_fname")
noextract=("$_jar_fname")
sha256sums=('75ae1f6f8722779a7c293a0a855fe8b6d5b12db655e4168d7427d5c790e992bc')

package() {
    cd "$srcdir"
    install -Ddm755 "$pkgdir/opt/fiji/plugins/"
    install -m644 "$_jar_fname" "$pkgdir/opt/fiji/plugins/"
}
