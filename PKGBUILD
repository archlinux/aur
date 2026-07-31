# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smyx-bin
_pkgname=smyx
pkgver=0.2.7
pkgrel=1
pkgdesc='Navidrome player for the terminal. With reactive themes.'
arch=(
    'x86_64'
)
url='https://github.com/ayanchavand/Smyx'
license=('MIT')
makedepends=('cargo')
options=(
    !lto
    !debug
    !strip
)
provides=('smyx')
conflicts=('smyx-git' 'smyx')
source=(
    "${_pkgname}-${pkgver}-bin.tar.gz::$url/releases/download/v${pkgver}/smyx-linux.tar.gz"
    "${_pkgname}-LICENSE-${pkgver}::https://raw.githubusercontent.com/ayanchavand/Smyx/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=(
    '307de5d40e95ab4813154ce4827f131fb8f6472dfd4deedeac44718542fbb8be'
    '335d6515a751141cb684fd404b0add3ba137506f98607f9f9447dab3e195a26e'
)

package() {
    install -Dm0755 smyx "$pkgdir/usr/bin/smyx"
    install -Dm644 "${_pkgname}"-LICENSE-"${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:
