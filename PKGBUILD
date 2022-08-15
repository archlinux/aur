# Maintainer: zjuyk <ownbyzjuyk@gmail.com>
pkgname=nordic-wallpapers
pkgver=20220812
pkgrel=1
pkgdesc="A collection of wallpapers that go well with the rices inspired by the Nord Colorscheme."
arch=('any')
url="https://github.com/linuxdotexe/nordic-wallpapers"
license=('MIT')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo $(TZ=UTC git log -1 --pretty='%cd' --date=short-local | tr -d '-')
}

package() {
	cd "$pkgname"
	install -Dm644 wallpapers/* -t "$pkgdir/usr/share/backgrounds/$pkgname/"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
