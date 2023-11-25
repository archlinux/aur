# Maintainer: Mitch Bigelow <ipha00@gmail.com>
# Contributor: delta48 <dark.magician.48+aur[at]gmail[dot]com>

pkgname=pixiewps-git
pkgver=1.4.2.r6.g464326f
pkgrel=1
pkgdesc="Offline bruteforce of the WPS pin exploiting the low or non-existing entropy of some APs"
arch=('i686' 'x86_64')
url="https://github.com/wiire/pixiewps"
license=('GPL')
depends=('openssl')
makedepends=('git')
conflicts=('pixiewps')
provides=('pixiewps')
source=("${pkgname}::git+https://github.com/wiire/pixiewps.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd "${srcdir}/${pkgname}"

    make
}

package() {
    cd "${srcdir}/${pkgname}"

    make PREFIX="${pkgdir}/usr" install
}
