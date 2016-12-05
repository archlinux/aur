# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=ravkavonline
pkgver="1.0.0"
pkgrel=2
pkgdesc="Ravkav Online client"
arch=('x86_64')
url="https://ravkavonline.co.il/"
license=('custom' 'MIT')
depends=(pcsclite)

source=("https://ravkavonline.co.il/releases/linux/${pkgname}_${pkgver}_amd64.deb" $pkgname.install)
sha256sums=('b0929e8d65317383b5c91f379417ee289ba0bfca47e9385a815c99ede3ff1d6d'
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
