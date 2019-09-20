# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=recallme
pkgver=1.1.0
pkgrel=1
pkgdesc="Emit a notification on a specific time or after some seconds"
arch=('x86_64' 'i686')
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
depends=("libnotify")
makedepends=("pkgconf")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('4f6cd43c15e5f4e02fd226cdd680b993cab9f6add277a12f7fad30837d401ce49360180c8131841141d6607e45c863c28a035fc2b336680574ca9438f6a23e6d')

build(){
    cd "$pkgname-v$pkgver"
    make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" build
}

package(){
    cd "$pkgname-v$pkgver"
    make DESTDIR=${pkgdir} PREFIX="/usr" install
}
