pkgname=newlogic
_pkgname=newlogic
pkgver=0.1.5_beta
_pkgver="0.1.5-beta"
pkgrel=2
pkgdesc="Circuit Builder Desktop Application (like mmlogic)"
arch=('any')
url="https://github.com/ericm/newlogic"
license=('MIT')
source=(
    "${_pkgname}-${_pkgver}.tar.gz"::"https://github.com/ericm/newlogic/releases/download/v${_pkgver}/newlogic-linux-v${_pkgver}.tar.gz"
)
sha256sums=('SKIP')

makedepends=('tar')

package() {
    rm "${_pkgname}-${_pkgver}.tar.gz"
    install -dm755  "$pkgdir"/usr/lib/node_modules/newlogic
    cp -R "$srcdir"/* "$pkgdir"/usr/lib/node_modules/newlogic
     
    install -dm755 "$pkgdir"/usr/bin
    ln -s /usr/lib/node_modules/newlogic/newlogic "$pkgdir"/usr/bin/newlogic
    install -dm755 "$pkgdir"/usr/share/applications
    cp "$srcdir"/newlogic.desktop "$pkgdir"/usr/share/applications
}
