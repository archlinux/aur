# Maintainer: Edouard Denommee <edouard dot denommee at savoirfairelinux dot com >
pkgname=cqfd
pkgver=5.3.0
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
    '2da37b22f13085fd2307d67edd42f0c638d0df5537b6703943b476cef12db6ca'
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
