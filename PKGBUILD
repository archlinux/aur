# Maintainer: yt <13133528465@163.com>
# Maintainerr: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=yt-popball
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A PopBall"
arch=(x86_64)
url="https://github.com/yt-theme/popBall"
license=('GPL3')
groups=()
depends=('qt5-base')
makedepends=()
checkdepends=()
optdepends=()
provides=("yt-popball")
conflicts=("yt-popball-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/yt-theme/popBall/archive/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"

}

build() {
	cd "$pkgname-$pkgver"
	#./configure --prefix=/usr
	qmake popBall.pro
	make

}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 popBall "$pkgdir/usr/bin/$pkgname"
	
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 res/popBall.svg "$pkgdir/usr/share/pixmaps/popBall.svg"
	install -D -m644 res/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	#install -D -m644 Changelog.md "$pkgdir/usr/share/doc/$pkgname/Changelog.md"
}
