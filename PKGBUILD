# Maintainer: longranger <longranger dot 406 at gmail dot com>
pkgname="noauto_mounter"
pkgver=0.5.r3.g05f3ce2
pkgrel=2
pkgdesc="auto mount local and nfs noauto fstab mounts"
arch=('x86_64')
url="https://github.com/longranger/noauto_mounter"
license=('GPL')
depends=()
makedepends=('git')
source=("${pkgname}-${pkgver}"::'git://github.com/longranger/noauto_mounter.git')
md5sums=('SKIP')
install='noauto_mounter.install'

pkgver() {
	cd "${pkgname}-${pkgver}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 noauto_mounter "${pkgdir}"/usr/bin/noauto_mounter
	install -Dm644 noauto_mounter.timer "${pkgdir}"/usr/lib/systemd/system/noauto_mounter.timer
	install -Dm644 noauto_mounter.service "${pkgdir}"/usr/lib/systemd/system/noauto_mounter.service
}
