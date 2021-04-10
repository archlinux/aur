# Maintainer: Benedikt Rips <benedikt.rips@gmail.com>

pkgname=goto-git
pkgver=2.0.0.r12.b7fda54
pkgrel=2
pkgdesc="Alias and navigate to directories with tab completion"
arch=('any')
url="https://github.com/iridakos/goto"
license=('MIT')
makedepends=('git')
provides=('goto')
conflicts=('goto')
source=("git+https://github.com/iridakos/goto.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/goto"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*\)-g/r\1./;s/-/./g')"
}

package() {
	cd goto
    install -Dm644 "goto.sh" "$pkgdir/usr/share/goto/goto.sh"
    install -Dm644 -t "$pkgdir/usr/share/doc/goto" CHANGELOG.md README.md
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/goto/LICENSE"
}
