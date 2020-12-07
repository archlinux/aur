# Maintainer: Sergey Starovoytov <sergey.starovoytov.94@gmail.com>

pkgname=(kvantum-manjaro-theme-git)
_pkgname=kvantum-manjaro
pkgver=r37.a316110
pkgrel=1
pkgdesc="Kvantum Manjaro theme based on works of Papirus Development Team and Tsu Jan"
provides=('kvantum-manjaro-theme')
arch=('any')
url="https://gitlab.manjaro.org/artwork/themes/$_pkgname"
license=('GPL3')
source=("git+$url.git")
sha256sums=('SKIP')
depends=('kvantum-qt5')
makedepends=('git')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd $_pkgname
	install -d $pkgdir/usr/share
	mv Kvantum color-schemes "$pkgdir/usr/share"
}
