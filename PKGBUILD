# Maintainer: Ittai D <ittai11 at gmail dot com>
pkgname=otf-monocraft-git
pkgver=r24.70c817b
pkgrel=2
pkgdesc="Minecraft-based monospace font"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=('unknown')
depends=()
makedepends=('git')
provides=("otf-monocraft")
conflicts=("otf-monocraft")
source=("$pkgname::git+https://github.com/IdreesInc/Monocraft.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {
	cd "$srcdir/${pkgname}"
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "Monocraft.otf"
}
