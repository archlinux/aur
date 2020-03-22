pkgname=turtlecoin-bin
pkgver=v0.24.0
pkgrel=0
pkgdesc="TurtleCoin daemon, CLI wallet, RPC interface, and solo miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('LGPLv3')
install="${pkgname}.install"
conflicts=('turtlecoin-git')
source=("https://github.com/turtlecoin/turtlecoin/releases/download/${pkgver}/turtlecoin-linux-${pkgver}.tar.gz")
sha256sums=('f12b9c937a319f43b598335f0d817838aa49d6c07d00af83f834f6aadaa5a508')

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
