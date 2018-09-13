pkgname=qrtorrent-git
pkgver=r15.5bbabc8
pkgrel=1
pkgdesc='rTorrent remote client written in Qt in C++'
url='https://github.com/varyoo/qrtorrent'
arch=(any)
depends=(xmlrpc-c)
makedepends=(git xmlrpc-c)
options=(!strip)

_commit=5bbabc84fe9bfc8e24a6ba7e7ef32835f569c2dd
source=(
    "git+https://github.com/varyoo/qrtorrent#commit=${_commit}"
    )

md5sums=(SKIP)

pkgver() {
    cd qrtorrent
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd qrtorrent
    qmake
    make release
}

package() {
    cd qrtorrent
    install -Dm755 qrtorrent "${pkgdir}/usr/bin/qrtorrent"
}
