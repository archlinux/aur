# Maintainer: Lance G. <gero3977 at gmail dot com>
# Contributor: Antoni Boucher <bouanto at zoho dot com>

pkgname='mobile-config-firefox'
pkgver=2.0.0
pkgrel=2
pkgdesc="Mobile and privacy friendly configuration for Firefox"
url="https://gitlab.com/postmarketOS/mobile-config-firefox"
license=('GPL')
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('firefox')
source=("https://gitlab.com/postmarketOS/mobile-config-firefox/-/archive/${pkgver}/mobile-config-firefox-${pkgver}.tar.gz"
    "0001-Update-links-for-ArchLinux.patch")
sha256sums=("97da1d1c61bb0730b203629488c00514c5f4672aa9bf3574e6255cb9a42bfa85"
    "be6c30de864c812edc897c9d7bf4896f646fa73268d945646032eb1a9a8926f0")

prepare() {
    cd $pkgname-$pkgver
    patch --forward --strip=1 --input="${srcdir}/0001-Update-links-for-ArchLinux.patch"
}

build() {
    cd $pkgname-$pkgver
    make DISTRO=ArchLinux
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
