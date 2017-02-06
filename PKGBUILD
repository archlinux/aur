# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=sipcmd-git
pkgver=r31.ea2f66b
pkgrel=1
pkgdesc="Command line soft phone"
url="https://github.com/tmakkonen/sipcmd"
arch=('i686' 'x86_64')
license=('GPL')
depends=("gcc-libs" "opal")
source=("sipcmd::git+https://github.com/tmakkonen/sipcmd.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/sipcmd"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd sipcmd
    make
}

package() {
    install -Dm755 "$srcdir/sipcmd/sipcmd" "$pkgdir/usr/bin/sipcmd"
}
