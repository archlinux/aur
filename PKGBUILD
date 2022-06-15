# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

pkgname=erigon
pkgver=2022.06.03
pkgrel=1
pkgdesc='Ethereum implementation on the efficiency frontier.'
arch=('x86_64')
url='https://github.com/ledgerwatch/erigon'
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
source=("git+https://github.com/ledgerwatch/erigon.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd ${pkgname}

    export CGO_LDFLAGS="${LDFLAGS}"
    make all
}

package() {
    cd ${pkgname}

    install -Dm755 build/bin/erigon "${pkgdir}"/usr/bin/erigon
    install -Dm755 build/bin/rpcdaemon "${pkgdir}"/usr/bin/erigon-rpcdaemon
    install -Dm755 build/bin/sentry "${pkgdir}"/usr/bin/erigon-sentry
    install -Dm755 build/bin/downloader "${pkgdir}"/usr/bin/erigon-downloader
    install -Dm755 build/bin/txpool "${pkgdir}"/usr/bin/erigon-txpool
    install -Dm755 build/bin/integration "${pkgdir}"/usr/bin/erigon-integration
    install -Dm755 build/bin/hack "${pkgdir}"/usr/bin/erigon-hack
}
