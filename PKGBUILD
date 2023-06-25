# Maintainer: tblFlip <root@tblflip.de>

pkgname=liftoff-bin
pkgver=0.9.12
pkgrel=1
pkgdesc="A mobile and desktop lemmy client written in flutter"
_pkgname="${pkgname%-bin}"

arch=("x86_64")
url="https://github.com/liftoff-app/liftoff"
license=("GPL2")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-$arch-linux.tar.gz")
sha256sums=("54fe9571ddcea3f63ee2a3d6f5337f20851833b8c216c0a2828d761a5cda473d")

provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
	install -d "$pkgdir/opt/$_pkgname"
	install -d "$pkgdir/usr/bin"
	cp -ar --no-preserve=ownership data "$pkgdir/opt/$_pkgname/data"
	cp -ar --no-preserve=ownership lib "$pkgdir/opt/$_pkgname/lib"
	cp -a --no-preserve=ownership Liftoff "$pkgdir/opt/$_pkgname/Liftoff"
	ln -s "$pkgdir/opt/$_pkgname/Liftoff" -t "$pkgdir/usr/bin"
	chown -R root:root "$pkgdir/"
}
