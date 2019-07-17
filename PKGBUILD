# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=recallme
pkgver=1.0.3
pkgrel=1
pkgdesc="Emit a notification on a specific time or after some seconds"
arch=('x86_64' 'i686')
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
depends=("libnotify")
makedepends=("pkgconf")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('1691b8aa8535cd8b8a0dca8d3b79671fdebf73b7559e2eeea81ce42afcbfc9aaf0961289b3c319059c68896e21ed389982d9d897e9108570f4d0b232a7386d1d')

build(){
    cd "$pkgname-v$pkgver"
    make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" build
}

package(){
    cd "$pkgname-v$pkgver"
    make DESTDIR=${pkgdir} PREFIX="/usr" install
}
