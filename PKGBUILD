# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=sensu-go-cli
pkgver=5.6.0
_pkgver="${pkgver}-2141"
pkgrel=1
pkgdesc="Sensu Go CLI"
arch=('x86_64')
url='https://sensu.io'
license=('MIT')
source=("${pkgname}-${_pkgver}_amd64.deb::https://packagecloud.io/sensu/stable/packages/ubuntu/cosmic/${pkgname}_${_pkgver}_amd64.deb/download.deb")
sha1sums=('bb3b7ee1fd2ec3f0964a43df71a15652cadab8c6')

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

