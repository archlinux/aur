# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=backup-git
gitname=backup
pkgver=1.2.0
pkgrel=2
pkgdesc='A simple tar based incremental daily backup script based on systemd'
arch=('x86_64')
url="https://github.com/dhtseany/backup"
license=('any')
makedepends=('git')
depends=('tar' 'pigz')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dhtseany/${gitname}/archive/refs/tags/v${pkgver}.tar.gz")

# Upstream tar.gz
sha512sums=('db4cc28d4319bb978f39a215ec933f98a4cc0f04fe58ee7ddfd0ef529b7803459cd7cb0e5e864a4084f83f5e86898ad881d2890280c728b291d7cca141be8809')

package() {
	install -Dm 755 "${srcdir}/${gitname}-${pkgver}/backup" "${pkgdir}/usr/bin/backup/backup"
	install -Dm 755 "${srcdir}/${gitname}-${pkgver}/backup.conf" "${pkgdir}/etc/backup.conf"
	install -Dm 755 "${srcdir}/${gitname}-${pkgver}/backup.service" "${pkgdir}/etc/systemd/system/backup.service"
	install -Dm 755 "${srcdir}/${gitname}-${pkgver}/backup.timer" "${pkgdir}/etc/systemd/system/backup.timer"
	install -Dm 755 "${srcdir}/${gitname}-${pkgver}/email.sh" "${pkgdir}/usr/bin/backup/email.sh"
}