# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=mc-cli
pkgver=20180114
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

    install -p -Dm 755 "${srcdir}/bin/mc-cli" "${pkgdir}/usr/bin/mc-cli"
}
