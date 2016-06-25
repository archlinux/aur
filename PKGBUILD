# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: kevku <kevku@gmx.com>
# Contributor: ajs124 < ajs ÄT online DOT de >


pkgname=wifite-mod-pixiewps-git
pkgver=67.cb8a19e
pkgrel=3
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
