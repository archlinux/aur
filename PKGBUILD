# Maintainer: Filip Borkiewicz <boreq 0x46 net>

pkgname=achannarasappa-ticker
pkgver=3.0.7
pkgrel=2
pkgdesc='terminal stock watcher and stock position tracker'
arch=('x86_64')
url='https://github.com/achannarasappa/ticker'
license=('GPL3')
makedepends=(
    'git'
    'go'
)
source=("ticker-$pkgver.tar.gz::https://github.com/achannarasappa/ticker/archive/v$pkgver.tar.gz")
sha512sums=('e8031944f5d581d27c548e7e646d38fe76ac7051a1f7ec4daeaa334d8eb62d8ee737fa4381f65d602f446109dc6e451241d6bdbc9e413cf6a56e8fe2e4c353a5')

build() {
    cd "ticker-${pkgver}"

    go build -o ./ticker .
}

package() {
    cd "ticker-${pkgver}"

    install -Dm755 ticker "${pkgdir}"/usr/bin/ticker
}
