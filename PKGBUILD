# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=srain
pkgver=0.03
pkgrel=1
pkgdesc="it does not look like a irc client"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/LastAvenger/srain"
depends=('gtk3' 'glib2' 'python')
makedepends=('git' 'make' 'gcc' 'pkg-config' 'gettext' 'curl')
conflicts=('srain')
provides=('srain')
source=("https://github.com/LastAvenger/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('422a99128394397f269cfd2e27efca192ab7b231ba32d5e7dcf728a66baa947d')

build() {
    cd ${pkgname}-${pkgver}
    make init
    make DESTDIR=/usr
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=$pkgdir/usr install
}
