# Maintainer jyny chen <simon54894@gmail.com>

pkgname=outliner
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI tool for Auto setup and deploy Outline VPN"
url="https://github.com/Jyny/outliner"
license=('MIT')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jyny/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("e1eb2c2e1a4a9f9abdb8e034bbb72a6f232cf2dd77105f13a1a1860211af7fce")
makedepends=('go' 'git')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

#vim: syntax=sh
