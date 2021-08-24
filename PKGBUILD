# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Erik D. erikd256 @github
pkgname=dcch64-c-backend-c
pkgver=v1.0.prerelease
pkgrel=1
epoch=
pkgdesc="DCCH64 is an Pine H64 based DCC model railroad controlling station."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/DCCH64/DCCH64"
license=('GPL')
depends=(wiringpi-git)
makedepends=(git)
source=("https+git://github.com/DCCH64/DCCH64-backend-c.git")
md5sums=('SKIP')


build() {
    cd "$pkgname"
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}/" install
}
