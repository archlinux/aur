# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=tlog
pkgver=11
pkgrel=1
epoch=
pkgdesc="Terminal I/O logger"
arch=(x86_64)
url="http://scribery.github.io/tlog/"
license=('GPL')
groups=()
depends=(curl json-c libutempter)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("etc/tlog/tlog-play.conf" "etc/tlog/tlog-rec.conf" "etc/tlog/tlog-rec-session.conf")
options=()
install=
changelog=
source=("https://github.com/Scribery/tlog/releases/download/v$pkgver/tlog-$pkgver.tar.gz")
noextract=()
md5sums=('050e924a605ec9bd2d5b911e1397c63f')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
