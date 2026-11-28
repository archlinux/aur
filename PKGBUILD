# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proxysql_exporter-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Prometheus exporter for ProxySQL"
arch=('x86_64')
url="https://github.com/percona/proxysql_exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/percona/proxysql_exporter/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/proxysql_exporter_linux_amd64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('06fcd0b6cbb493464ef045a463929bfef32c8ad9db614a6ffe06260ab6795823')

package() {
  install -Dm755 "proxysql_exporter" "${pkgdir}/usr/bin/proxysql_exporter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
