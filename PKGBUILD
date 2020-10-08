pkgname=turtlecoin-bin
pkgver=v1.0.0
pkgrel=0
pkgdesc="TurtleCoin daemon, CLI wallet, RPC interface, and solo miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('GPLv3')
install="${pkgname}.install"
conflicts=('turtlecoin-git')
source=("https://github.com/turtlecoin/turtlecoin/releases/download/${pkgver}/turtlecoin-linux-${pkgver}.tar.gz")
sha256sums=('3768900749aea5503a13488eec33e933bad35f07bf2789574603a78c2b1ff555')

package() {
    # extract the tarball
    tar xfz turtlecoin-linux-${pkgver}.tar.gz

    # Rename some executables so we don't conflict with other coins
    install -D -m755 "turtlecoin-${pkgver}/miner" -T "$pkgdir/usr/bin/trtl-miner"
    install -D -m755 "turtlecoin-${pkgver}/zedwallet" -T "$pkgdir/usr/bin/trtl-zedwallet"
    install -D -m755 "turtlecoin-${pkgver}/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "turtlecoin-${pkgver}/wallet-api" -T "$pkgdir/usr/bin/trtl-wallet-api"
}
