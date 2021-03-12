# Maintainer: Aron Cederholm <gmail>

pkgname=mem
pkgver=1.2
pkgrel=1
pkgdesc='A colorized memory inspector for terminals and consoles'
arch=('any')
url='https://bitbucket.org/Hrafnahnef/mem'
license=('BSD3')
groups=()
makedepends=(gcc make)
depends=(ncurses glibc gcc-libs)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"https://bitbucket.org/Hrafnahnef/mem/downloads/$pkgname-$pkgver.tar.zst"
	"https://bitbucket.org/Hrafnahnef/mem/downloads/$pkgname-$pkgver.tar.zst.sig"
)
validpgpkeys=('AD5582360F6A567CA5356535610CE1A9A5BD39C9')
noextract=()
md5sums=('d4f84f5865f63029dca28b201f136a86'
         'eba3ff07f3e0b94a55043054189600ca')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
        install -Dm755 "mem" "$pkgdir/usr/bin/mem"
	mkdir -p -m0755 "$pkgdir/usr/share/man/man1/"
	install -Dm644 "mem.1.gz" $pkgdir/usr/share/man/man1/
	mkdir -p -m0755 "$pkgdir/usr/share/mem/"
	install -Dm644 "memrc.template" "$pkgdir/usr/share/mem/"
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
