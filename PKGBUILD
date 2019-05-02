# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=goautolock
pkgver=1.2.0
pkgrel=1
pkgdesc="Killable autolocker for X11"
arch=('x86_64' 'i686')
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
provides=("goautolock")
depends=("libx11" "libxss" "libnotify")
makedepends=("go")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('147496ddc19d0ba00f73220cb93297b41c65edf3af4fcee791377cc0ff8d1184fbdd4d859be63bf85fbe15a768fa38979759559d300e7b90dba70b3e8963e0cf')

build(){
    cd "$pkgname-v$pkgver"
    make build #From v1.2.0 uses PIE by default with production builds
}

package(){
    cd "$pkgname-v$pkgver"
    make DESTDIR=${pkgdir} PREFIX="/usr" install
}
