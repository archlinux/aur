# Maintainer: Steffen Fritz <aur AT fritz DOT wtf>
pkgname=pacaudit
pkgver=0.1
pkgrel=1
pkgdesc="This package audits installed packages against known vulnerabilities. Use after pacman -Syu."
arch=('i686' 'x86_64')
url="https://github.com/steffenfritz/pacaudit"
license=('GPL3')
makedepends=('go>=1.6')
options=('!strip')
source=("https://github.com/steffenfritz/pacaudit/archive/master.zip")

build() {
    cd pacaudit-master
    go build -o pacaudit -ldflags "-s -w"
}

package() {
    mkdir -p $pkgdir/usr/bin
    cd pacaudit-master
    install -m700 $srcdir/pacaudit-master/pacaudit $pkgdir/usr/bin/pacaudit

}
sha256sums=('73e5fc2594fa3f6fee2505faa1c022a53aaf0f72da1b212faed8979d8581803f')
