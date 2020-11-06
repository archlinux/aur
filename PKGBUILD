# Maintainer: Zpalmtree <https://github.com/zpalmtree>
pkgname=violetminer-bin
pkgver=v0.2.2
pkgrel=0
pkgdesc='Argon2 CPU and Nvidia miner for TurtleCoin and WrkzCoin'
arch=('x86_64' 'aarch64')
url='https://github.com/turtlecoin/violetminer'
license=('GPL3')
conflicts=('violetminer-git')
source_x86_64=("https://github.com/turtlecoin/violetminer/releases/download/${pkgver}/violetminer-linux-${pkgver}.tar.gz")
source_aarch64=("https://github.com/turtlecoin/violetminer/releases/download/${pkgver}/violetminer-aarch64-${pkgver}.tar.gz")
sha256sums_x86_64=('51c179c7f76ab0fe0ef3eefa5614cc7a878c8377b96762897e56f489653b4801')
sha256sums_aarch64=('a3d599bbb64eb995b74b2cf611faa81ef908b81914dd8463f6eb54a93e973670')

package() {
    platform='linux'

    if [ "$CARCH" = 'aarch64' ];
    then
        platform='aarch64'
    fi

    # Extract from archive
    tar -xf "violetminer-${platform}-${pkgver}.tar.gz"

    # Install in /usr/bin/
    install -D -m755 "violetminer-${platform}-${pkgver}/violetminer" -t "$pkgdir/usr/bin/"
}
