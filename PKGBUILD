pkgname=turtlecoin-bin
pkgver=v0.3.1
pkgrel=1
pkgdesc="Turtlecoin simplewallet and miner"
arch=('x86_64')
url="https://turtlecoin.lol"
license=('custom')
install="${pkgname}.install"
depends=('boost-libs' 'boost')
conflicts=('turtlecoin-git')
source=("https://github.com/turtlecoin/turtlecoin/releases/download/${pkgver}/TurtleCoin-${pkgver}-linux-CLI.tar.gz")
sha256sums=('f6c265187e8b4d622dc901bb72de16259f5ac20311ef77a5e92215be562312ed')

package() {
    # extract the tarball
    mkdir -p "TurtleCoin-${pkgver}-linux-CLI" && tar xfz TurtleCoin-${pkgver}-linux-CLI.tar.gz -C "TurtleCoin-${pkgver}-linux-CLI"

    install -D -m755 "TurtleCoin-${pkgver}-linux-CLI/miner" -T "$pkgdir/usr/bin/trtl-miner"
    install -D -m755 "TurtleCoin-${pkgver}-linux-CLI/simplewallet" -T "$pkgdir/usr/bin/trtl-simplewallet"
    install -D -m755 "TurtleCoin-${pkgver}-linux-CLI/TurtleCoind" -t "$pkgdir/usr/bin/"
    install -D -m755 "TurtleCoin-${pkgver}-linux-CLI/walletd" -T "$pkgdir/usr/bin/trtl-walletd"
}
