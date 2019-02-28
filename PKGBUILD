# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: deadc <deadcow@archlinux.com.br>
# Contributor: N.Izumi aka izmntuk

pkgname=ncompress
pkgver=4.2.4.5
pkgrel=2
pkgdesc="The classic unix compression utility which can handle the ancient .Z archive"
arch=('i686' 'x86_64')
url="https://github.com/vapier/$pkgname"
license=('GPL')
provides=('compress')
depends=('glibc')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('9ab5d54d764d38050e9256b635bf09a9')

build() {
	make -C "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 Acknowleds "$pkgdir/usr/share/doc/$pkgname/Acknowleds"
	install -m644 Changes "$pkgdir/usr/share/doc/$pkgname/Changes"
	install -m644 LZW.INFO "$pkgdir/usr/share/doc/$pkgname/LZW.INFO"
	install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm755 compress "$pkgdir/usr/bin/compress"
	install -Dm644 compress.1 "$pkgdir/usr/share/man/man1/compress.1"
}
