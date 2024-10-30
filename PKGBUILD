# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=supersdr
pkgver=3.14
pkgrel=1
pkgdesc="An advanced KiwiSDR client with CAT transceiver integration"
arch=('any')
url="https://github.com/mcogoni/supersdr"
depends=('python' 'python-pygame' 'python-sounddevice' 'python-numpy' 'python-scipy' 'python-requests' 'python-urllib3' 'python-xmltodict')
makedepends=('imagemagick')
source=(
    "$pkgname-$pkgver".tar.gz::"https://github.com/mcogoni/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.desktop"
)
sha256sums=(
    '6c252063c667965f7db81089c938c20587a70edccb3c1a57aeea0e24e93163ac'
    'e194c790358852aaa529e0e3c55a70e22e8db0279de149b642ca445db39a4562'
)

package() {
	install -Ddm 755 "$pkgdir/opt/$pkgname"
	magick "$srcdir/$pkgname-$pkgver/icon.jpg" "$srcdir/$pkgname-$pkgver/icon.png"
	install -Dm644 "$srcdir/$pkgname-$pkgver/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	cp -r "$srcdir/$pkgname-$pkgver/"* "$pkgdir/opt/$pkgname/"
}
