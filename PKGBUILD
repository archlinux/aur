# Maintainer: Salvaje <keystroke33@gmail.com>
pkgname=uproot-git
pkgver=r5.fb51847
pkgrel=1
pkgdesc="Move or copy deeply nested files and folders to the surface or another folder"
arch=('any')
url="https://github.com/keystroke3/uproot"
license=('GPLv3+')
depends=()
depends=('python>=3.7')
makedepends=('git')
provides=('uproot')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd $pkgname
	install -Dm755 * -t "$pkgdir/opt/$pkgname"
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/uproot.py" "$pkgdir/usr/bin/uproot"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
