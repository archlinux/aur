# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=dracula-xresources
pkgname=$_pkgname-git
pkgver=r10.8de1197
pkgrel=1
pkgdesc="Dark theme for X11 applications"
arch=('any')
url="https://draculatheme.com/xresources"
license=('MIT')
groups=('dracula-theme')
makedepends=('git')
optdepends=('xorg-xrdb')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/dracula/xresources.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 Xresources "$pkgdir"/etc/X11/xinit/.Xresources.d/dracula
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
