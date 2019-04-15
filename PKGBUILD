# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=goautolock
pkgver=1.0.0
pkgrel=2
pkgdesc="Killable autolocker for X11"
arch=('x86_64' 'i686')
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
provides=("goautolock")
depends=("libxss")
makedepends=("go")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('1a2025824ba98febe96409c29d26e73a363f73506fda0738272c7cb28ae9f94248ea245dcb536f1823b5f84674cf24e16c9704aae296d02a41aa2af394152d96')

build(){
    cd "$pkgname-v$pkgver"
    make build #buildmode PIE and -race are not compatible. Dropping PIE
}

package(){
    cd "$pkgname-v$pkgver"
    make DESTDIR=${pkgdir} PREFIX="/usr" install
}
