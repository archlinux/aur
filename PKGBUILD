# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=yoyo-leaf-git
pkgver=r5.87bb693
pkgrel=1
pkgdesc='An awesome command-line fuzzy finder'
arch=('x86_64')
url='https://github.com/Yggdroot/Yoyo-leaf'
license=('Apache')
makedepends=('git')
provides=('yoyo-leaf' 'yy')
conflicts=('yoyo-leaf' 'yy')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/Yoyo-leaf"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/Yoyo-leaf"
    make -j$(nproc)
}

package() {
    install -Dm 755 "${srcdir}/Yoyo-leaf/build/leaf" \
        "${pkgdir}/usr/bin/yy"
}

