# $Id$
# Maintainer: Antoni Boucher <bouanto at zoho dot com>

pkgname='mobile-config-firefox'
pkgver=1.0.1
pkgrel=1
pkgdesc="Mobile and privacy friendly configuration for Firefox"
url="https://gitlab.com/postmarketOS/mobile-config-firefox"
license=('GPL')
arch=('x86_64')
depends=('firefox')
source=("git+https://gitlab.com/postmarketOS/mobile-config-firefox"
    "0001-Update-links-for-ArchLinux.patch")
sha256sums=("SKIP"
    "SKIP")

prepare() {
    cd $pkgname
    patch --forward --strip=1 --input="${srcdir}/0001-Update-links-for-ArchLinux.patch"
}

package() {
    cd $pkgname
    make DISTRO=ArchLinux DESTDIR=$pkgdir install
}
