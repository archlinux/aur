# Maintainer: wick3dr0se <wick3dr0se@protonmail.com>

pkgname=sysfetch-git
pkg_name=sysfetch
pkgver=0.1
pkgrel=1
pkgdesc="A super tiny system information fetch script written in BASH"
arch=(any)
url="https://github.com/wick3dr0se/sysfetch"
license=(GPL3)
depends=('coreutils' 'bash' 'awk' 'sed' 'psmisc' 'grep' 'pacman')
optdepends=('xorg-xprop: fallback for X session info'
'pciutils: to detect gpu')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
cd "$srcdir/$pkg_name"
git describe --long --tags | cut -d'-' -f1
}

package() {
cd "$srcdir/$pkg_name"
install -Dm755 "$pkg_name" "$pkgdir/usr/bin/$pkg_name"
install -m 0755 -d "$pkgdir/usr/share/$pkg_name/assets"
install -m 0755 assets/*.sh "$pkgdir/usr/share/$pkg_name/assets"
}
