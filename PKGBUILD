#
# Please note:
#   Export your keys using export_keys command in
#   trtl-simplewallet before upgrading to version
#   0.4.3.
#   
#   For more information visit:
#       https://github.com/turtlecoin/turtlecoin/releases/tag/v0.4.3
#

pkgname=turtlecoin-bin
pkgver=v0.4.3
pkgrel=1
pkgdesc="Turtlecoin simplewallet and miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('LGPLv3')
install="${pkgname}.install"
conflicts=('turtlecoin-git')
source=("https://github.com/turtlecoin/turtlecoin/releases/download/${pkgver}/turtlecoin-${pkgver}-linux-static.tar.gz")
sha256sums=('4cde75bb25804ecdab4049cd1eeb65107018c7833c70f1cb146feaeae5124ca3')

package() {
    # extract the tarball
    tar xfz turtlecoin-${pkgver}-linux-static.tar.gz

    install -D -m755 "turtlecoin-${pkgver}-linux-static/miner" -T "$pkgdir/usr/bin/trtl-miner"
    install -D -m755 "turtlecoin-${pkgver}-linux-static/simplewallet" -T "$pkgdir/usr/bin/trtl-simplewallet"
    install -D -m755 "turtlecoin-${pkgver}-linux-static/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "turtlecoin-${pkgver}-linux-static/walletd" -T "$pkgdir/usr/bin/trtl-walletd"
    install -D -m755 "turtlecoin-${pkgver}-linux-static/poolwallet" -T "$pkgdir/usr/bin/trtl-poolwallet"
}
