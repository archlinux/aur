# Maintainer: éclairevoyant

_pkgname=swaymonad
pkgname="$_pkgname-git"
pkgver=r12.fb12c2a
pkgrel=1
pkgdesc="Auto-tiler for sway that implements Xmonad-like layouts"
arch=(any)
url="https://github.com/nicolasavru/$_pkgname"
license=(MIT)
depends=('python>=3.10' python-i3ipc sway)
makedepends=(git)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	install -Dm755 $_pkgname.py "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
