# Maintainer: Edouard Denommee <edouard dot denommee at savoirfairelinux dot com >
pkgname=cqfd
pkgver=5.5.0
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
    '995b9ff3e39eb8ae2c4308b538e614081f6bf6853b616ba9eb05f496a24402b4'
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
