# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=dh-exec
pkgver=0.23
pkgrel=1
pkgdesc='Debhelper executable file substition helpers'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/algernon/dh-exec'
license=('GPL3')

makedepends=('autoconf')
optdepends=(
)
source=(
    'https://github.com/algernon/dh-exec/archive/dh-exec-0.23.tar.gz'
)
sha512sums=(
    '82b6f36e88060b5a71483b502e9f9cdd8f13d195b9c83ff633df180286d98dc586db6cfaad1b0249884d34758d1ce3ac4b01baf37c07d81ac47c381dc7ce11bd'
)

build() {
    cd "${pkgname}-${pkgname}-${pkgver}"
    autoreconf --install
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make
}

package() {
    cd "${pkgname}-${pkgname}-${pkgver}"
    make install DESTDIR="$pkgdir"
}
