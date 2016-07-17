# Maintainer: Stavros Polymenis <sp@orbitalfox.com>
pkgname=portal
pkgver=0.2
pkgrel=4
pkgdesc="A personal portal system. Alpha version, do not install unless you know what you are doing"
arch=(any)
url="https://github.com/orbifx/portal"
license=('LGPL3')
groups=()
depends=(sudo postfix dovecot nginx avahi)
makedepends=()
optdepends=(yamado-git)
provides=("portal")
conflicts=()
replaces=()
options=()
install="portal.install"
changelog=
source=(#"git+https://github.com/orbifx/portal.git"
  https://github.com/orbifx/portal/releases/download/v0.3-alpha/portal.tar.gz)
noextract=()
md5sums=('ff3343d24e2ec014d0e62d3cbb37cef6')

package() {
	install -Dm544 portal "$pkgdir/usr/bin/portal"
	install -Dm544 portal-postconf "$pkgdir/usr/bin/portal-postconf"
	install -Dm544 portal-doveconf "$pkgdir/usr/bin/portal-doveconf"
	install -Dm440 ../portal.sudo "${pkgdir}/etc/sudoers.d/${pkgname}"
	install -Dm544 ../master.cf "$pkgdir/usr/share/portal/master.cf"
	install -Dm544 ../10-master.conf "$pkgdir/usr/share/portal/10-master.conf"
	install -Dm544 ../avahi.service "$pkgdir/etc/avahi/services/portal.service"
}
