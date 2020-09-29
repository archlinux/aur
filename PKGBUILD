# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=soks-git
pkgver=r4.59552a7
pkgrel=1
pkgdesc="A minimalistic SOCKS5 server proxy over a network interface (like a VPN or a second physical network device)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dariost/soks"
license=('MPL2')
depends=()
makedepends=('git')
provides=('soks')
conflicts=('soks')
source=("git+https://github.com/dariost/soks.git")
sha384sums=('SKIP')

pkgver() {
    cd "$srcdir/soks"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/soks"
    make
}

package() {
    cd "$srcdir/soks"
    install -Dm755 soks "$pkgdir/usr/bin/soks"
}
