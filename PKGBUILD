# Maintainer: Wiktor Kwapisiewicz <wiktor@metacode.biz>

pkgname=capture-packages
pkgver=2
pkgrel=1
pkgdesc="Writes the list of packages to /etc/pkglist.txt"
license=('APL')
url="https://codeberg.org/wiktor/capture-packages"
arch=('any')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha512sums=('762d576690b24824e8c8ff84fa811977c904d15b99e64403d9339c3737248b0f13d85b8f5316cf7bea5e168e197e16e0a55b2161b33cbac9038e607ebff038ec')

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" "capture-packages.hook"
}
