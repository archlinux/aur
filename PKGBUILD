# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: éclairevoyant
# Contributor: Manuel Palenzuela <sadshinobi at protonmail dot com>

_pkgname=dwmbar
pkgname="$_pkgname-git"
pkgver=0.r201.f112628
pkgrel=2
pkgdesc='Simple and modular status bar for dwm'
# some of the modules are x86_64 ELFs
arch=(x86_64)
url="https://github.com/thytom/$_pkgname"
license=(GPL3)
depends=(bash)
makedepends=(git)
optdepends=(dwm)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	install -vDm755 $_pkgname -t "$pkgdir/usr/bin/"

	install -vdm755 "$pkgdir/usr/share/$_pkgname/"
	cp -a --no-preserve=ownership {config,bar.sh,modules} "$pkgdir/usr/share/$_pkgname"
}
