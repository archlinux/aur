# Maintainer: Edouard Denommee <edouard dot denommee at savoirfairelinux dot com >
pkgname=cqfd
pkgver=5.4.0
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
    '917a411169e23c3d027fb89f77a57654c7160682f1958ad2548199f2ec35de09'
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
