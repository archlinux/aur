# Maintainer: wick3dr0se <wick3dr0se@protonmail.com>

pkgname=sysfetch-git
pkg=sysfetch
pkgver=0.1
pkgrel=1
pkgdesc="A super tiny system information fetch script written in BASH"
arch=(any)
url="https://github.com/wick3dr0se/sysfetch"
license=(GPL3)
depends=('bash' 'awk')
optdepends=(
    'pciutils: detect gpu'
    'wmctrl: better theme detection'
)
makedepends=('git' 'debugedit' 'fakeroot')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkg"|| return 1
    git describe --long --tags | cut -d'-' -f1
}

package() {
    cd "$srcdir/$pkg"|| return 1
    install -Dm 755 $pkg $pkgdir/usr/bin/$pkg
}
