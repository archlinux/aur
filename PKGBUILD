# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=goautolock
pkgver=1.3.2
pkgrel=1
pkgdesc="Killable autolocker for X11"
arch=('x86_64' 'i686')
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
provides=("goautolock")
depends=("libx11" "libxss" "libnotify")
makedepends=("go")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('537ada1eee68be952fb544f1fb42583d7dd065bada883a2198d58d5bf87952036a69f2812776f6fdf37d46092c7d3937325e3f8e44ce05ec2468a8e27690ab40')

build(){
    cd "$pkgname-v$pkgver"
    make build #From v1.2.0 uses PIE by default with production builds
}

package(){
    cd "$pkgname-v$pkgver"
    make DESTDIR=${pkgdir} PREFIX="/usr" install
}
