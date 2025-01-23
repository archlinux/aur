# Maintainer: Edouard Denommee <edouard dot denommee at savoirfairelinux dot com >
pkgname=cqfd
pkgver=5.6.0
pkgrel=1
pkgdesc="Run commands with the same user and directory inside a docker container"
arch=('any')
url="https://github.com/savoirfairelinux/cqfd"
license=('GPL3')
optdepends=(
    'tar: create tar archives'
    'zip: create zip archives'
)
# checkdepends=(
#     'make'
#     'docker'
#     'tar'
#     'zip'
# )
source=(
    "$pkgname-$pkgver.tar.gz"::$url/archive/v$pkgver.tar.gz
)
sha256sums=(
    'b4afd6e9ed583b8af6880041e5931b4dde3451e862bfc119c2aede06485de3de'
)

# check() {
#     cd "${srcdir}/${pkgname}-${pkgver}"
#     make tests
# }

package() {
    depends=('docker')
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="$pkgdir" PREFIX="/usr"
}
