# Maintainer: Nathan Kolpa <nathan@kolpa.me>
pkgname=xmonad-recompile-hook-git
pkgver=1.2.1
pkgrel=2
pkgdesc="Recompile xmonad after package updates"
arch=('any')
url="https://github.com/NathanKolpa/xmonad-recompile-hook.git"
license=('GPL')
depends=(xmonad)
makedepends=(git)
options=()
source=("git+$url")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
	cd "xmonad-recompile-hook"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "xmonad-recompile-hook"
	mkdir -p "$pkgdir/usr/share/libalpm/hooks/"
	cp xmonad-recompile.hook "$pkgdir/usr/share/libalpm/hooks/xmonad-recompile.hook"
}
