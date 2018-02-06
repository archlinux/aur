pkgname=turtlecoin-bin
pkgver=v0.3.1
pkgrel=2
pkgdesc="Turtlecoin simplewallet and miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('custom')
install="${pkgname}.install"
conflicts=('turtlecoin-git')
source=("https://github.com/turtlecoin/turtlecoin/releases/download/${pkgver}/TurtleCoin-${pkgver}-linux-staticboost-CLI.tar.gz")
sha256sums=('98f95ac907c47eeff63949ec943afa3e04c7def91005bef4eade04bf1302e25d')

package() {
    # extract the tarball
    mkdir -p "TurtleCoin-${pkgver}-linux-staticboost-CLI" && tar xfz TurtleCoin-${pkgver}-linux-staticboost-CLI.tar.gz -C "TurtleCoin-${pkgver}-linux-staticboost-CLI"

    install -D -m755 "TurtleCoin-${pkgver}-linux-staticboost-CLI/miner" -T "$pkgdir/usr/bin/trtl-miner"
    install -D -m755 "TurtleCoin-${pkgver}-linux-staticboost-CLI/simplewallet" -T "$pkgdir/usr/bin/trtl-simplewallet"
    install -D -m755 "TurtleCoin-${pkgver}-linux-staticboost-CLI/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "TurtleCoin-${pkgver}-linux-staticboost-CLI/walletd" -T "$pkgdir/usr/bin/trtl-walletd"
}
