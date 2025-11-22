# Maintainer: tjbp (archlinux@tjbp.net)

pkgname=mtd-cli
pkgver=001
pkgrel=1
pkgdesc='A command line client to interface with the UK’s HMRC Make Tax Digital API'
arch=('x86_64' 'i686')
url='https://github.com/ac000/mtd-cli'
license=('GPL-2.0-only')
depends=('libmtdac')
source=("https://github.com/ac000/mtd-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9adfbe79c1fd87814a8ecdfb3e074907c066fbc48e5ba1a4dc7a207bb0c75d55')

build() {
    cd mtd-cli-$pkgver
    make
}

package() {
    cd mtd-cli-$pkgver

    install -Dp -m0755 src/mtd-cli $pkgdir/usr/bin/mtd-cli
}
