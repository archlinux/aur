# Maintainer: Nissar Chababy <funilrys at outlook dot com>

pkgname=laverna
pkgver=0.7.4
pkgrel=1
pkgdesc="Laverna is a JavaScript note taking application with Markdown editor and encryption support. Consider it like open source alternative to Evernote."
arch=("x86_64" "i686")
depends=('gconf')
url="https://laverna.cc/"
license=('MPL2')
source=("$pkgname.desktop")
source_x86_64=("https://github.com/Laverna/laverna/releases/download/$pkgver-RC1/$pkgname-$pkgver-RC1-linux-x64.zip")
source_i686=("https://github.com/Laverna/laverna/releases/download/$pkgver-RC1/$pkgname-$pkgver-RC1-linux-ia32.zip")
sha512sums=('e14850537e1dece925fcae70985115aa44dfae16845069cf6901f1c4dd868d3e77cdee272849d1d61b5886052dc323d8f890d8482c89641d15db18ef3f0e0c8a')
sha512sums_x86_64=('318d37f1774cb59819f7bc27e016320cf8e152bf25d677d76cb96b307ff49ab7a5576990eaa4cdbd8b84cc645e4366ced63d6af6cd98e798c7412b057e1df290')
sha512sums_i686=('b69cb875146c0e0e7a59b220be9074b13d2727ddb225c311e4a2a8a87f9ea18711340fdef4bf19021dfea7b90d897869da68dfe9db0e66e69932cffc2b889976')

package() {
	mkdir -p $pkgdir/{opt/$pkgname,usr/{bin,share/applications}}
	cp -R $srcdir/* $pkgdir/opt/$pkgname
	ln -s /opt/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
	cp $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
