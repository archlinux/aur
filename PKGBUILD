# Maintainer: Nissar Chababy <funilrys at outlook dot com>

pkgname=laverna
pkgver=0.7.4
pkgrel=1
pkgdesc="Laverna is a JavaScript note taking application with Markdown editor and encryption support. Consider it like open source alternative to Evernote."
arch=("x86_64" "i686")
url="https://laverna.cc/"
license=('MPL2')
#makedepends=('')
#depends=('')
source=("$pkgname.desktop")
source_x86_64=("https://github.com/Laverna/laverna/releases/download/$pkgver/$pkgname-$pkgver-RC1-linux-x64.zip")
source_i686=("https://github.com/Laverna/laverna/releases/download/$pkgver/$pkgname-$pkgver-RC1-linux-ia32.zip")
md5sums=('d1e55c28507b9cde3e1899c6f5b813e6')
md5sums_x86_64=('f41fc704c0fdff16949874bfcf2de8c6')
md5sums_i686=('8340f0451e4403893395f28879a73178')

package() {
	mkdir -p $pkgdir/{opt/$pkgname,usr/{bin,share/applications}}
	cp -R $srcdir/* $pkgdir/opt/$pkgname
	ln -s /opt/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
	mv $pkgdir/opt/$pkgname/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

