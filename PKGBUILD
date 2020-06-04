pkgname=turtlecoin-bin
pkgver=v0.26.0
pkgrel=0
pkgdesc="TurtleCoin daemon, CLI wallet, RPC interface, and solo miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('GPLv3')
install="${pkgname}.install"
conflicts=('turtlecoin-git')
source=("https://github.com/turtlecoin/turtlecoin/releases/download/${pkgver}/turtlecoin-linux-${pkgver}.tar.gz")
sha256sums=('a80b638d98f5560e3ee1c5b2a23e22791ddf5c0a456432e0c6ced5dee26249c4')

package() {
    # extract the tarball
    tar xfz turtlecoin-linux-${pkgver}.tar.gz

    # Rename some executables so we don't conflict with other coins
    install -D -m755 "turtlecoin-${pkgver}/miner" -T "$pkgdir/usr/bin/trtl-miner"
    install -D -m755 "turtlecoin-${pkgver}/zedwallet" -T "$pkgdir/usr/bin/trtl-zedwallet"
    install -D -m755 "turtlecoin-${pkgver}/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "turtlecoin-${pkgver}/turtle-service" -t "$pkgdir/usr/bin/"
    install -D -m755 "turtlecoin-${pkgver}/wallet-api" -T "$pkgdir/usr/bin/trtl-wallet-api"
    install -D -m755 "turtlecoin-${pkgver}/wallet-upgrader" -T "$pkgdir/usr/bin/trtl-wallet-upgrader"
}
