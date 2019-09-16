# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=goautolock
pkgver=1.4.2
pkgrel=1
pkgdesc="Killable autolocker for X11"
arch=('x86_64' 'i686')
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
provides=("goautolock")
depends=("libx11" "libxss" "libnotify")
makedepends=("go")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('8c2f7188808e4206a50a9c2b9e52cb935c14ffd74e5082be9b408a018decacf2f5bd2d8a424b9f11305cecb648aa5c167945eafaa334e9c1415a3c79bd0035b7')

build(){
    cd "$pkgname-v$pkgver"
    make build #From v1.2.0 uses PIE by default with production builds
}

package(){
    cd "$pkgname-v$pkgver"
    make DESTDIR=${pkgdir} PREFIX="/usr" install
}
