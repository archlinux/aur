pkgname=turtlecoin-bin
pkgver=v0.22.0
pkgrel=0
pkgdesc="TurtleCoin daemon, CLI wallet, RPC interface, and solo miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('LGPLv3')
install="${pkgname}.install"
conflicts=('turtlecoin-git')
source=("https://github.com/turtlecoin/turtlecoin/releases/download/${pkgver}/turtlecoin-linux-${pkgver}.tar.gz")
sha256sums=('70a61019acbe71605ab93c5d447e8714024dca84f7a31a9c9956892c9960e912')

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
