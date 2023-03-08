# Maintainer: Wiktor Kwapisiewicz <wiktor@metacode.biz>

pkgname=capture-packages
pkgver=1
pkgrel=1
pkgdesc="Keeps a list of packages"
license=('APL')
url="https://codeberg.org/wiktor/capture-packages"
arch=('any')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/wiktor/capture-packages/archive/v1.tar.gz")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha512sums=('80efc9de156bdeececf66529dbc91c7634377774225bb6e19051c440f8393c132c6cf8be5c610622d6314a3597770aec398987b46a75849363651292701db8c7')

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" "capture-packages.hook"
}
