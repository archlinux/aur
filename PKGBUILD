# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=ps4-pkg-tools-git
pkgver=r2914.e7c40358
pkgrel=1
pkgdesc='Stand-alone PS4 PKG extraction tool'
url='https://github.com/xXJSONDeruloXx/ps4-pkg-tools'
arch=("x86_64")
license=("GPLv2")
depends=('qt6-base')
makedepends=('cmake' 'gcc' 'git')
source=(
    "git+${url}.git"
)
md5sums=(
    'SKIP'
)

pkgver() {
    cd $srcdir/ps4-pkg-tools
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/ps4-pkg-tools
    make
}

package() {
    install -Dm755 $srcdir/ps4-pkg-tools/build/ps4-pkg-tool $pkgdir/usr/bin/ps4-pkg-tool
    install -Dm755 $srcdir/ps4-pkg-tools/build/ps4-pkg-tool-gui $pkgdir/usr/bin/ps4-pkg-tool-gui
}
