# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=docui-git
pkgver=2.0.4.r13.g5e66d09
pkgrel=1
pkgdesc="TUI Client for Docker"
url="https://github.com/skanehira/docui"
license=('MIT')
source=("${pkgname}::git+https://github.com/skanehira/docui.git")
arch=('any')
sha256sums=('SKIP')
depends=('go')
conflicts=('docui-bin')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "$srcdir/$pkgname"
    make build
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 docui "${pkgdir}/usr/bin/docui"
}

#vim: syntax=sh
