# Maintainer: wick3dr0se <wick3dr0se@protonmail.com>

pkgname=sysfetch-git
pkg=sysfetch
pkgver=0.1
pkgrel=1
pkgdesc="A super tiny system information fetch script written in BASH"
arch=(any)
url="https://github.com/wick3dr0se/sysfetch"
license=(GPL3)
depends=('coreutils' 'bash' 'awk' 'sed' 'psmisc' 'grep')
optdepends=('xorg-xprop: X session info (fallback)'
'pciutils: detect gpu'
'wmctrl: better theme detection')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
cd $srcdir/$pkg
git describe --long --tags | cut -d'-' -f1
}

package() {
cd $srcdir/$pkg
install -dm 755 $pkgdir/usr/share/$pkg/sys
install -m 755 sys/*.sh $pkgdir/usr/share/$pkg/sys
install -Dm 755 $pkg $pkgdir/usr/bin/$pkg
}
