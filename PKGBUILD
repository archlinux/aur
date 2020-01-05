# Maintainer: Filon Oikonomou <filwn.oikonomou@gmail.com>
pkgname=xfce-superkey-git
pkgver=v0.5.r0.4115c97
pkgrel=1
pkgdesc="Open the whisker menu launcher in XFCE using the Super key"
arch=('any')
url="https://github.com/JixunMoe/xfce-superkey"
license=('GPL')
depends=(libxtst)
makedepends=(git)
source=("git+https://github.com/JixunMoe/xfce-superkey.git")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/xfce-superkey"
    rm -rf build && mkdir build
}

pkgver() {
    cd "${srcdir}/xfce-superkey"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/xfce-superkey"
    make
}

package() {
    cd "${srcdir}/xfce-superkey"
    make DESTDIR="$pkgdir/" PREFIX="/usr/" install
}
