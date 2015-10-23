# Maintainer: Stavros Polymenis <sp@orbitalfox.com>
pkgname=portal
pkgver=0.1.4
pkgrel=1
pkgdesc="A personal portal system. Alpha version, do not install unless you know what you are doing"
arch=(any)
url="http://orbitalfox.com"
license=('LGPL3')
groups=()
depends=(sudo postfix dovecot nginx)
makedepends=()
optdepends=(yamado)
provides=("portal")
conflicts=()
replaces=()
options=()
install="portal.install"
changelog=
source=(#"git+https://github.com/orbifx/portal.git"
	https://github.com/orbifx/portal/releases/download/v0.1-beta/portal.tar.gz)
noextract=()
md5sums=('0dbb12b1ff479f33765fb4bb91ccae7a')

package() {
	install -Dm544 portal "$pkgdir/usr/bin/portal"
	install -Dm544 portal-postconf "$pkgdir/usr/bin/portal-postconf"
	install -Dm544 portal-dovecont "$pkgdir/usr/bin/portal-doveconf"
	install -Dm440 ../portal.sudo "${pkgdir}/etc/sudoers.d/${pkgname}"
}
