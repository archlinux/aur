# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=flips
# Each commit to master should be treated as a release as per upstream recommendation.
pkgver=145
_commit=eb3b86f0f5c8a61ab9b3d982ab949877b9060ea1
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
