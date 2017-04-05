# Maintainer    : Dan Beste <dan.ray.beste@gmail.com>
# Contributor   : Jestine Paul <jestine dot paul at gmail dot com>

pkgname='libcs50-git'
gitname='libcs50'
pkgver=7.1.2.r3.g8a353ba
pkgrel=1
pkgdesc="CS50 Library for C"
arch=('x86_64' 'i686')
url="https://cs50.harvard.edu/"
license=('unknown')
groups=('cs50')
depends=('glibc')
makedepends=('git')
provides=('libcs50')
conflicts=('libcs50')
source=('git+https://github.com/cs50/libcs50.git')
md5sums=('SKIP')

pkgver() {
    cd "${gitname}"

    git describe --tags                     \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g'  \
        | sed 's/v//'
}

build() {
    cd "${gitname}"

    make build
}

package() {
    cd "${gitname}"

    cp -rp build/* "${pkgdir}"
}
