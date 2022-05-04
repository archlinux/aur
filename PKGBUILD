# Maintainer: Lance G. <gero3977 at gmail dot com>
# Contributor: Antoni Boucher <bouanto at zoho dot com>

pkgname='mobile-config-firefox-git'
pkgver=3.0.0+5+g87689ef
pkgrel=1
pkgdesc="Mobile and privacy friendly configuration for Firefox"
url="https://gitlab.com/postmarketOS/mobile-config-firefox"
license=('GPL')
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('firefox')
source=("$pkgname::git+https://gitlab.com/postmarketOS/mobile-config-firefox")

sha256sums=("SKIP")

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/-/+/g; s/^v//'
}

build() {
    cd $pkgname
    make DISTRO=ArchLinux
}

package() {
    cd $pkgname
    make DESTDIR=$pkgdir install
}
