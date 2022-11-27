# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=xkb-lt-git
pkgver=r1.a79d2a5
pkgrel=1
pkgdesc="An X keyboard configuration for US Qwerty and Lithuanian diacritics"
arch=('any')
url="https://github.com/tmneth/xkb-lt"
license=('MIT')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "xkb-lt"
    sudo chmod +x ./patch.sh
    sudo ./patch.sh
}
