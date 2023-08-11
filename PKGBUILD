# Maintainer: Nikhil Singh <nik.singh710@gmail.com>
pkgname=basic-battery-stat
pkgver=r5.3136117
pkgrel=1
pkgdesc="Simple utility to show battery state"
arch=("x86_64")
url="https://github.com/niksingh710/basic-battery-stat"
license=('WTFPL')
makedepends=("git")
optdepends=("qt5-tools: Mobile Battery Support (qdbus)"
	"kdeconnect: Connecting with Mobile Device")
source=("git+https://github.com/niksingh710/basic-battery-stat.git")
md5sums=('SKIP')
provides=('basic-battery-stat')
conflicts=('basic-battery-stat')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm755 ./basic-battery-stat "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./Readme.md "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
