pkgname=turtlecoin-bin
pkgver=v0.8.4
pkgrel=1
pkgdesc="Turtlecoin daemon, CLI wallet, RPC interface, and solo miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('LGPLv3')
install="${pkgname}.install"
conflicts=('turtlecoin-git')
source=("https://github.com/turtlecoin/turtlecoin/releases/download/${pkgver}/turtlecoin-${pkgver}-linux.tar.gz")
sha256sums=('dffb14bdf5140ca27cb905f527110ae262009d2e32e9e8c60f43b636b4e41a9e')

package() {
    # extract the tarball
    tar xfz turtlecoin-${pkgver}-linux.tar.gz

    # Not the same as pkgver :(
    version_string=v.0.8.4

    # Rename some executables so we don't conflict with other coins
    install -D -m755 "turtlecoin-${version_string}/miner" -T "$pkgdir/usr/bin/trtl-miner"
    install -D -m755 "turtlecoin-${version_string}/zedwallet" -T "$pkgdir/usr/bin/trtl-zedwallet"
    install -D -m755 "turtlecoin-${version_string}/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "turtlecoin-${version_string}/turtle-service" -t "$pkgdir/usr/bin/"
}
