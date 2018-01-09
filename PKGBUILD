# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=ravkavonline
pkgver="1.4.0"
pkgrel=1
pkgdesc="Ravkav Online client - unofficial package"
arch=('x86_64')
url="https://ravkavonline.co.il/"
license=('custom' 'MIT')
depends=(pcsclite)

source=("https://ravkavonline.co.il/releases/linux/${pkgname}_${pkgver}_amd64.deb" $pkgname.install)
sha256sums=('88aa9ce366f3c3e4bff8dd90e5f6ca612b25c44c1dac50bd4e7580bfc7eeee4f'
		'91373cde0ef5a269db942aaabe53bb553748306e9d7ef5aedf05183bd42f8447')
install=$pkgname.install

prepare() {
	tar -xf data.tar.xz
}

package() {
  install -dm 755 $pkgdir/usr/{bin,share/{applications,doc/$pkgname}}
  install -Dm 755 $srcdir/usr/bin/$pkgname $pkgdir/usr/bin
  install -Dm 755 $srcdir/usr/share/applications/$pkgname.desktop $pkgdir/usr/share/applications
  install -Dm 644 $srcdir/usr/share/doc/$pkgname/{LICENSE.txt,changelog.gz} $pkgdir/usr/share/doc/$pkgname/
   
}
