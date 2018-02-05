pkgname=turtlecoin-bin
pkgver=v0.3.0
pkgrel=1
pkgdesc="Turtlecoin simplewallet and miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('custom')
install="${pkgname}.install"
conflicts=('turtlecoin-git')
source=("https://github.com/turtlecoin/turtlecoin/releases/download/${pkgver}/TurtleCoin-${pkgver}-linux-static-CLI.tar.gz")
sha256sums=('35b643d3646f52c472fa24c008aa5e17301a93db0a005bb48b7c5cc8ddc642e0')

package() {
    # extract the tarball
    tar xfz TurtleCoin-${pkgver}-linux-static-CLI.tar.gz

    install -D -m755 "TurtleCoin-v0.3.0-linux-static-CLI/connectivity_tool" -T "$pkgdir/usr/bin/trtl-connectivity_tool"
    install -D -m755 "TurtleCoin-v0.3.0-linux-static-CLI/miner" -T "$pkgdir/usr/bin/trtl-miner"
    install -D -m755 "TurtleCoin-v0.3.0-linux-static-CLI/simplewallet" -T "$pkgdir/usr/bin/trtl-simplewallet"
    install -D -m755 "TurtleCoin-v0.3.0-linux-static-CLI/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "TurtleCoin-v0.3.0-linux-static-CLI/walletd" -T "$pkgdir/usr/bin/trtl-walletd"
}
