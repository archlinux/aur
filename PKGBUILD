# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute-cli
pkgver=20170207
pkgrel=1
pkgdesc='Command line tool to interact with a running moolticute daemon'
arch=('x86_64' 'i686')
license=('GPL3')
depends=('moolticute')
makedepends=('git'
             'go')
url="https://github.com/raoulh/${pkgname}"
_gourl="${url##https://}"

build() {
    cd "${srcdir}"

    GOPATH="${srcdir}" go get -fix -v -x "${_gourl}"
}

package() {
    cd "${srcdir}"

    install -p -Dm 755 "${srcdir}/bin/moolticute-cli" "${pkgdir}/usr/bin/moolticute-cli"
}
