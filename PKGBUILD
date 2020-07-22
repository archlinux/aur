# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantnotify
pkgname=$_pkgname
pkgver=202007201829
pkgrel=1
pkgdesc="notification center for instantOS"
url="https://github.com/instantOS/instantNOTIFY"
arch=('any')
license=('MIT')
depends=('sh' 'instantmenu')
makedepends=('git')
provides=(instantnotify)
conflicts=(instantnotify)
source=("$_pkgname::git+https://github.com/instantOS/instantNOTIFY.git")

sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    cd $_pkgname
    echo "no prepare"
}

build() {
    cd $_pkgname
    echo "no build"
}

package() {
    cd $_pkgname
    mkdir -p ${pkgdir}/usr/bin
    rm install.sh
    chmod +x ./*.sh
    for i in ./*.sh; do
        mv "$i" "${pkgdir}/usr/bin/${i%.sh}"
    done

}
