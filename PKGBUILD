# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=goimports-reviser
pkgname=${_pkgname}-git
pkgver=r102.573c4d8
epoch=1
pkgrel=1
pkgdesc=" Right imports sorting & code formatting tool (goimports alternative)."
arch=('i686' 'x86_64')
url="https://github.com/incu6us/goimports-reviser"
license=('MIT')
makedepends=('git' 'go' 'mercurial')
provides=("${_pkgname}")
_src='github.com/incu6us/goimports-reviser'

pkgver() {
    GOBIN=${srcdir}/bin GOPATH=${srcdir} go get -fix -u ${_src}
    cd src/${_src}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 bin/${_pkgname} $pkgdir/usr/bin/${_pkgname}
}
