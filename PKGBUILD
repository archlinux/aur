# Maintainer: Ranndom <Ranndom@rnndm.xyz>

pkgname=bitlbee-discord-git
pkgver=45.b899973
pkgrel=1
pkgdesc="Bitlbee plugin for Discord"
arch=('i686' 'x86_64')
url="https://github.com/sm00th/bitlbee-discord"
license=('GPL')
depends=('bitlbee')
makedepends=('git' 'libwebsockets-git')
source=("git+https://github.com/sm00th/bitlbee-discord")
sha256sums=('SKIP')

pkgver() {
    cd "bitlbee-discord"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "bitlbee-discord"
    make
}

package() {
    install -D -m644 $srcdir/bitlbee-discord/discord.so $pkgdir/usr/lib/bitlbee/discord.so
}
