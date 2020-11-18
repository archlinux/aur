# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cds-bin
pkgver=0.47.0
pkgrel=1
pkgdesc='Enterprise-Grade Continuous Delivery & DevOps Automation Open Source Platform'
arch=('x86_64')
url="https://ovh.github.io/cds/"
license=('BSD')
depends=('redis' 'postgresql')
provides=('cds')
install=cds.install
depends=('glibc')
source=("${pkgname}-${pkgver}::https://github.com/ovh/cds/releases/download/${pkgver}/cds-engine-linux-amd64"
    "SQL-Examples.tar.gz::https://github.com/ovh/cds/releases/download/${pkgver}/sql.tar.gz"
    "cdsctl::https://github.com/ovh/cds/releases/download/${pkgver}/cdsctl-linux-amd64"
    'LICENSE::https://raw.githubusercontent.com/ovh/cds/master/LICENSE')
sha256sums=('0fd487d962602052e064e813116f932cdaa007e0e5680d75b007be18a0532278'
            'b35a4d1986b16f47a7860817bc5b94bcd4705e6f3a9a69682d262b81fc2ff94a'
            '8fd610c35cb59eab30906448519f7c91f70997c4982992fc09789377511ff817'
            '921f21fa54ed0af9769ec53c985558e835d935046d4c704d7b39f133a72efbd2')

package() {
  install -Dm755 ${srcdir}/${pkgname}-${pkgver} "${pkgdir}/usr/bin/cds-engine"
  install -Dm644 ${srcdir}/*.sql -t "${pkgdir}/usr/share/cds/sql-examples"
  install -Dm755 ${srcdir}/cdsctl "${pkgdir}/usr/bin/cdsctl"
  install -Dm644 ${srcdir}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
