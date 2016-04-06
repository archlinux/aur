# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')
# Past maintainer: kevku <kevku@gmx.com>
# Contributor: ajs124 < ajs ÄT online DOT de >


pkgname=wifite-mod-pixiewps-git
pkgver=67.cb8a19e
pkgrel=2
pkgdesc="A tool to attack multiple WEP and WPA encrypted networks at the same time mod with Pixie Dust Attack support"
arch=(any)
url="https://github.com/aanarchyy/wifite-mod-pixiewps"
license=('GPL')
depends=(python2 aircrack-ng aircrack-ng-scripts python2-pexpect reaver-wps-fork-t6x-git)
optdepends=(tk macchanger pyrit-svn cowpatty wireshark-cli)
makedepends=(git)
replaces=(wifite wifite-svn wifite-git)
conflicts=(wifite wifite-svn wifite-git)
provides=(wifite)
source=($pkgname::git+https://github.com/aanarchyy/wifite-mod-pixiewps.git)
sha512sums=('SKIP')

pkgver() {
	cd ${pkgname}
        echo `git rev-list --count master`.`git rev-parse --short master`
}

prepare() {
	sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' ${pkgname}/wifite-ng
}

package() {
	install -D -m755 ${pkgname}/wifite-ng ${pkgdir}/usr/bin/wifite
}
