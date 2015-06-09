# Maintainer: ajs124 < aur AT ajs124 DOT de >

pkgname=wifite-git
pkgver=138.edbdedd
pkgrel=1
pkgdesc="A tool to attack multiple WEP and WPA encrypted networks at the same time"
arch=(any)
url="https://github.com/derv82/wifite"
license=('GPL')
depends=(python2 aircrack-ng aircrack-ng-scripts python2-pexpect)
optdepends=(tk macchanger pyrit-svn cowpatty reaver wireshark-cli)
makedepends=(git)
replaces=(wifite wifite-svn)
conflicts=(wifite wifite-svn)
source=($pkgname::git+https://github.com/derv82/wifite.git)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
        echo `git rev-list --count master`.`git rev-parse --short master`
}

prepare() {
	sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' $pkgname/wifite.py
}

package() {
	install -D -m755 $pkgname/wifite.py ${pkgdir}/usr/bin/wifite
}
