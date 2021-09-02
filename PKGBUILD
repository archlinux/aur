# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=flips
# Each commit to master should be treated as a release as per upstream recommendation.
pkgver=126
_commit=3476e5e46fc6f10df475f0cad1714358ba04c756
pkgrel=1
pkgdesc="Floating IPS - Applies and creates IPS and BPS patches"
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
