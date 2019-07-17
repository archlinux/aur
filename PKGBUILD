# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=recallme
pkgver=1.0.2
pkgrel=1
pkgdesc="Emit a notification on a specific time or after some seconds"
arch=('x86_64' 'i686')
url="https://gitlab.com/mrvik/${pkgname}"
license=("GPL2")
depends=("libnotify")
makedepends=("pkgconf")
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('46fc66a93df4e985a082fdfdece4c1b9d0575799bcd193986fd0c1b2279b04d7ab548f1a46d183b6a621119c8c1745c3b9f7732eebf1d3fbaf2007dd92acfe50')

build(){
    cd "$pkgname-v$pkgver"
    make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" build
}

package(){
    cd "$pkgname-v$pkgver"
    make DESTDIR=${pkgdir} PREFIX="/usr" install
}
