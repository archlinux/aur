#
# Please note:
#   Export your keys using export_keys command in
#   trtl-simplewallet before upgrading to version
#   0.3.2 (r135.7fcc6ad).
#   
#   For more information visit:
#       https://github.com/turtlecoin/turtlecoin/releases/tag/v0.3.2
#

pkgname=turtlecoin-bin
pkgver=v0.3.2
pkgrel=1
pkgdesc="Turtlecoin simplewallet and miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('LGPLv3')
install="${pkgname}.install"
conflicts=('turtlecoin-git')
source=("https://github.com/turtlecoin/turtlecoin/releases/download/${pkgver}/turtlecoin-${pkgver}-linux-staticboost.tar.gz")
sha256sums=('e7c5224c578fcd0fc50f43d3f0b98b9af9536e0b1c94a1113acece65d7c37981')

package() {
    # extract the tarball
    mkdir -p "TurtleCoin-${pkgver}-linux-staticboost-CLI" && tar xfz turtlecoin-${pkgver}-linux-staticboost.tar.gz -C "TurtleCoin-${pkgver}-linux-staticboost-CLI"

    install -D -m755 "TurtleCoin-${pkgver}-linux-staticboost-CLI/turtlecoin-${pkgver}/miner" -T "$pkgdir/usr/bin/trtl-miner"
    install -D -m755 "TurtleCoin-${pkgver}-linux-staticboost-CLI/turtlecoin-${pkgver}/simplewallet" -T "$pkgdir/usr/bin/trtl-simplewallet"
    install -D -m755 "TurtleCoin-${pkgver}-linux-staticboost-CLI/turtlecoin-${pkgver}/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "TurtleCoin-${pkgver}-linux-staticboost-CLI/turtlecoin-${pkgver}/walletd" -T "$pkgdir/usr/bin/trtl-walletd"
}
