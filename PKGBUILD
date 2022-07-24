# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=flips
# Each commit to master should be treated as a release as per upstream recommendation.
pkgver=137
_commit=ce2e7ca2175b7e8bf2b8d64216887ac3747fc750
pkgrel=1
pkgdesc="Patcher for IPS and BPS files"
depends=('gtk3')
makedepends=('git')
arch=('x86_64')
url="https://github.com/Alcaro/Flips"
license=('GPL')
source=("flips::git+https://github.com/Alcaro/Flips.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cd "${srcdir}"/$pkgname
    make
}

package() {
    cd "${srcdir}"/$pkgname
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
    install -Dm644 COPYING.gpl3 "${pkgdir}"/usr/share/licenses/$pkgname/COPYING.gpl3
}
