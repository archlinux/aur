# Maintainer: Zak Kohler <git@y2kbugger.com>

pkgname=dmenu-recent-aliases-git
pkgver=1.0.0.r2.gffb39fc
pkgrel=2
pkgdesc="Dmenu2 based application launcher. Supports user bash aliases."
arch=('any')
url="https://gitlab.com/y2kbugger-projects/scripts/dmenu-recent-aliases"
license=('MIT')
depends=('dmenu')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/y2kbugger-projects/scripts/dmenu-recent-aliases.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname%-git}"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
