# Maintainer: fzerorubigd <fzero@rubi.gd>

pkgname=gogetdoc-git
pkgver=91.20190227
pkgrel=1
pkgdesc="Gets documentation for items in Go source code."
arch=('i686' 'x86_64')
url="https://github.com/zmb3/gogetdoc"
license=('BSD')
depends=('glibc')
makedepends=('go' 'git')
source=('git+https://github.com/zmb3/gogetdoc')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/gogetdoc"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git log -1 --format=%cd --date=short | tr -d -)"
}

build() {
    cd "${srcdir}/gogetdoc"
    go build -o gogetdoc
}

package() {
    cd "${srcdir}/gogetdoc"
    install -Dm755 gogetdoc "${pkgdir}/usr/bin/gogetdoc"
}
