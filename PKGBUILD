# Maintainer: Zpalmtree <https://github.com/zpalmtree>
pkgname=violetminer-bin
pkgver=v0.1.1
pkgrel=0
pkgdesc='Argon2 CPU and Nvidia miner for TurtleCoin and WrkzCoin'
arch=('x86_64' 'aarch64')
url='https://github.com/turtlecoin/violetminer'
license=('GPL3')
conflicts=('violetminer-git')
source_x86_64=("https://github.com/turtlecoin/violetminer/releases/download/${pkgver}/violetminer-linux.tar.gz")
source_aarch64=("https://github.com/turtlecoin/violetminer/releases/download/${pkgver}/violetminer-armv8.tar.gz")
sha256sums_x86_64=('81d594915160424d8aa1be96c9a5a78b4214bcf5946587e73cebd8b195a9e29f')
sha256sums_aarch64=('0cce24bdac82e45ed8fc42809f71dff333582e4a26b8a11dad67a45a74bc6ff3')

package() {
    platform='linux'

    if [ "$CARCH" = 'aarch64' ];
    then
        platform='armv8'
    fi

    # Extract from archive
    tar -xf "violetminer-${platform}.tar.gz"

    # Install in /usr/bin/
    install -D -m755 "violetminer-${platform}/violetminer" -t "$pkgdir/usr/bin/"
}
