# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=recallme
pkgver=1.0.1
pkgrel=1
pkgdesc="Emit a notification on a specific time or after some seconds"
arch=('x86_64' 'i686')
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
depends=("libnotify")
makedepends=("pkgconf")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('397942b3cd53b39c9bfd91261de67e2c9eb25bfd734026fd89cca4cbd4f236e84771e3b0cf7e171bbaa0f4ec6807b1d15431d65093ceee439c97dad2c2ad5eea')

build(){
    cd "$pkgname-v$pkgver"
    make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" build
}

package(){
    cd "$pkgname-v$pkgver"
    make DESTDIR=${pkgdir} PREFIX="/usr" install
}
