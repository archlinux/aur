# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=goautolock
pkgver=1.4.1
pkgrel=1
pkgdesc="Killable autolocker for X11"
arch=('x86_64' 'i686')
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
provides=("goautolock")
depends=("libx11" "libxss" "libnotify")
makedepends=("go")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('c8b2a501790791f161a97e54a064099e9de34aa8234da87d2a3758e5f44daa0d72146100f30996c59412601b3d513cb9fd7adefc056449f057547254b6e4a7ec')

build(){
    cd "$pkgname-v$pkgver"
    make build #From v1.2.0 uses PIE by default with production builds
}

package(){
    cd "$pkgname-v$pkgver"
    make DESTDIR=${pkgdir} PREFIX="/usr" install
}
