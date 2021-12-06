# Maintainer: wick3dr0se <https://github.com/wick3dr0se/sysfetch>

pkgname=sysfetch-git
_pkgname=sysfetch
pkgver=0.1
pkgrel=1
pkgdesc="A super tiny Linux system information fetch script written in BASH"
arch=(any)
url="https://github.com/wick3dr0se/sysfetch"
license=(GPL3)
depends=('coreutils' 'bash' 'awk' 'sed' 'psmisc' 'grep' 'pacman')
optdepends=('xorg-xprop: fallback for X session info'
'pciutils: for gpu detection')
makedepends=('git')
source=("git+${url}") 
sha256sums=('SKIP')

pkgver() {
cd "$srcdir/$_pkgname"
git describe --long --tags | cut -d'-' -f1
}

package() {
cd "$srcdir/$_pkgname"
install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
install -m 0755 -d "$pkgdir/usr/share/$_pkgname/components"
install -m 0755 components/*.sh "$pkgdir/usr/share/$_pkgname/components"
install -m 0755 -d "$pkgdir/usr/share/$_pkgname/assets"
install -m 0755 assets/*.sh "$pkgdir/usr/share/$_pkgname/assets"
}
