# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=goautolock
pkgver=1.3.0
pkgrel=1
pkgdesc="Killable autolocker for X11"
arch=('x86_64' 'i686')
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
provides=("goautolock")
depends=("libx11" "libxss" "libnotify")
makedepends=("go")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('257858284060cc159fee4a0275f41585f43137bd81e24f6dc5baddd281ca057b16fd287fa44a48ecdcf367f42d079b9699396a569c60a1844ed40813241f4869')

build(){
    cd "$pkgname-v$pkgver"
    make build #From v1.2.0 uses PIE by default with production builds
}

package(){
    cd "$pkgname-v$pkgver"
    make DESTDIR=${pkgdir} PREFIX="/usr" install
}
