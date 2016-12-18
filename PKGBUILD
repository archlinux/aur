# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: deadc <deadcow@archlinux.com.br>
# Contributor: N.Izumi aka izmntuk

pkgname=ncompress
pkgver=4.2.4.4
pkgrel=3
pkgdesc="The classic unix compression utility which can handle the ancient .Z archive"
arch=('i686' 'x86_64')
url="https://github.com/vapier/$pkgname"
_commit=81f0ac4e2d10f6412a8bd97e38d46716f399af3a
license=('GPL')
provides=('compress')
depends=('glibc')
source=("$url/archive/$_commit.tar.gz")
md5sums=('ace90c1d8cabab6d7d68166d37eb99aa')

build() {
	make -C "$pkgname-$_commit"
}

package() {
	cd "$pkgname-$_commit"
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	install -dm755 "$pkgdir/usr/share/man/man1"
	install -m644 Acknowleds "$pkgdir/usr/share/doc/$pkgname"
	install -m644 Changes "$pkgdir/usr/share/doc/$pkgname"
	install -m644 LZW.INFO "$pkgdir/usr/share/doc/$pkgname"
	install -m644 README.md "$pkgdir/usr/share/doc/$pkgname"
	install -m755 compress "$pkgdir/usr/bin"
	install -m644 compress.1 "$pkgdir/usr/share/man/man1"
}
