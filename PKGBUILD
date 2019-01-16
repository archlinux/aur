pkgname=turtlecoin-bin
pkgver=v0.12.0
pkgrel=1
pkgdesc="TurtleCoin daemon, CLI wallet, RPC interface, and solo miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('LGPLv3')
install="${pkgname}.install"
conflicts=('turtlecoin-git')
source=("https://github.com/turtlecoin/turtlecoin/releases/download/${pkgver}/turtlecoin-${pkgver}-linux.tar.gz")
sha256sums=('32eae225807f4a18e255c5d26250c46467b8d7503fda6094b4198d64463ca498')

package() {
    # extract the tarball
    tar xfz turtlecoin-${pkgver}-linux.tar.gz

    # Rename some executables so we don't conflict with other coins
    install -D -m755 "turtlecoin-${pkgver}/miner" -T "$pkgdir/usr/bin/trtl-miner"
    install -D -m755 "turtlecoin-${pkgver}/zedwallet" -T "$pkgdir/usr/bin/trtl-zedwallet"
    install -D -m755 "turtlecoin-${pkgver}/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "turtlecoin-${pkgver}/turtle-service" -t "$pkgdir/usr/bin/"
    install -D -m755 "turtlecoin-${pkgver}/zedwallet-beta" -T "$pkgdir/usr/bin/trtl-zedwallet-beta"
    install -D -m755 "turtlecoin-${pkgver}/wallet-api" -T "$pkgdir/usr/bin/trtl-wallet-api"
}
