# Maintainer: Edouard Denommee <edouard dot denommee at savoirfairelinux dot com >
pkgname=cqfd
pkgver=5.2.1
pkgrel=1
pkgdesc="Run commands with the same user and directory inside a docker container"
arch=('any')
url="https://github.com/savoirfairelinux/cqfd"
license=('GPL3')
optdepends=(
    'tar: create tar archives'
    'zip: create zip archives'
)
makedepends=('make')
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
    'ae93cced933aae4d9faf0dbe67afb942ef8997610f01fc4bd12e57ad95c0cca3'
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
