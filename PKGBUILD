# Maintainer: Auston S <austonst@gmail.com>

pkgname=mev-boost
pkgver=1.4.0
pkgrel=1
pkgdesc='MEV middleware for Ethereum validators'
arch=('x86_64')
url='https://boost.flashbots.net/'
license=('MIT')
depends=('go')
makedepends=('make' 'git')
conflicts=('mev-boost')
source=("git+https://github.com/flashbots/mev-boost.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd ${pkgname}
    make build
    make build-portable
}

package() {
    cd ${pkgname}

    install -D -m755 "$srcdir/$pkgname/mev-boost" "$pkgdir/usr/bin/mev-boost"
    install -D -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
