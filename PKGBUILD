# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=sensu-go-cli
pkgver=5.1.1
_pkgver=5.1.1-0ubuntu18.1
pkgrel=1
pkgdesc="Sensu Go CLI"
arch=('x86_64')
url='https://sensu.io'
license=('MIT')
source=("${pkgname}-${_pkgver}_amd64.deb::https://packagecloud.io/sensu/stable/packages/ubuntu/cosmic/${pkgname}_${_pkgver}_amd64.deb/download.deb")
sha1sums=('6d92e36957266c5e3733535b0316c65baecbb4ec')

prepare() {
    cd "${srcdir}"
    tar xaf data.tar.gz
}

# TODO: better build from source
# build() {}

package() {
    install -Dm755 "${srcdir}/usr/bin/sensuctl" "${pkgdir}/usr/bin/sensuctl"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/LICENSE.txt"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname}-${pkgver}/README.txt" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/README.txt"
}

