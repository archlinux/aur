# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cds-bin
pkgver=0.45.2
pkgrel=2
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
sha256sums=('3a877b3c80c7cd5d7b2989fd1524dac9bd3ea73ade0268afb4111f0a440fa0be'
			'ab83ac54c61b5059983cc88a3d407de7e32cf34b9828b9d67b194f34c36cb852'
			'942eb7d4faa4ff4506e857055857eadc76a901abae246f4f6d0de37bb7da36c3'
			'921f21fa54ed0af9769ec53c985558e835d935046d4c704d7b39f133a72efbd2')

package() {
  install -Dm755 ${srcdir}/${pkgname}-${pkgver} "${pkgdir}/usr/bin/cds-engine"
  install -Dm644 ${srcdir}/*.sql -t "${pkgdir}/usr/share/cds/sql-examples"
  install -Dm755 ${srcdir}/cdsctl "${pkgdir}/usr/bin/cdsctl"
  install -Dm644 ${srcdir}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: