# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
pkgname=enhancd
pkgver=2.5.1
pkgrel=3
pkgdesc="A next-generation cd command with your interactive filter "
arch=(any)
url="https://github.com/babarot/enhancd"
license=('MIT')
install=$pkgname.install
source=("https://github.com/babarot/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
		"0001-Do-not-quote-multiple-lines-to-deal-as-single-line-2.patch")
sha256sums=('93a3b935a9e9d9e7201827e7b45ee52df8eb77caf4bd93552f8fecc5fb634e28'
            '2e270c18b2f0ecfa9aa7983fe9e88bcbd65bc04d34c4fd9f2873e95dc0c157b4')

prepare(){
	cd $pkgname-$pkgver/
	patch -p1 < ../0001-Do-not-quote-multiple-lines-to-deal-as-single-line-2.patch
}

package() {
	install -d $pkgdir/usr/share/enhancd
	cp -r $pkgname-$pkgver/* "$pkgdir/usr/share/enhancd/"
}
