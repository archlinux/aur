# Maintainer: Martin Harrigan <martinharrigan at gmail dot com>
# Contributor: Dylon Edwards <dylon dot devo at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>
# Contributor: James Henderson
pkgname='datomic-bin'
pkgdesc='A database of flexible, time-based facts, supporting queries and joins, with elastic scalability and ACID transactions.'
url='https://www.datomic.com/'
provides=('datomic')
conflicts=('datomic')
replaces=('datomic')
pkgver='1.0.7394'
pkgrel='1'
arch=('any')
license=('APACHE')
depends=('java-environment')
install="${pkgname%-bin}.install"
source=(
  "${pkgname%-bin}-${pkgver}.zip::https://datomic-pro-downloads.s3.amazonaws.com/${pkgver}/${pkgname%-bin}-pro-${pkgver}.zip"
  "transactor.properties"
)
sha256sums=('8e3a6334dfc728c1c431dccc537dc88a9d2baf70f29bad5438df9d7c8c7146ae'
            'e622f80994c4c21e52d59f8724d06fc6672c25479224619d3cc172df32fe31de')

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname%-bin}-pro-${pkgver}" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/transactor.properties" -t "${pkgdir}/etc/${pkgname%-bin}"
    mkdir -p "${pkgdir}/var/lib/${pkgname%-bin}" "${pkgdir}/var/log/${pkgname%-bin}"
}
