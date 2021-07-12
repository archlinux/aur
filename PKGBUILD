# Maintainer Jerry Y. Chen <chen@jyny.dev>

pkgname=outliner
pkgver=0.2.2
pkgrel=4
pkgdesc="CLI tool for Auto setup and deploy Outline VPN"
url="https://github.com/Jyny/outliner"
license=('MIT')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jyny/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("1ffc4f2be4f183fa0094eb622c19f4b4838dcced071a2cfbce0869e2bee253f3")
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
