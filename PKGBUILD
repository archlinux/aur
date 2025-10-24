# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=tabdance
pkgver=0.0.25
pkgrel=1
pkgdesc='WIP: private preview'
arch=('x86_64')
url='https://tab.dance'
license=('custom: commercial')
depends=('github-cli')
makedepends=('github-cli')
provides=("${pkgname}")
conflicts=("${pkgname}")

build() {
    gh release download --repo tab-dance/tabdance "v${pkgver}" --pattern "tabdance_${pkgver}_linux_amd64.tar.gz"
    tar -xzf "tabdance_${pkgver}_linux_amd64.tar.gz" tabdance
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/tabdance" "${pkgdir}/usr/bin/"
}
