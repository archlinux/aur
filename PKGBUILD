# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=guiscrcpy
pkgver=1.11
pkgrel=6
pkgdesc="A full fledged GUI integration for the most award winning open-source Android screen mirroring system -- scrcpy"
arch=('i686' 'x86_64')
url="https://srevinsaju.github.io/guiscrcpy"
license=('GPL3')
depends=('scrcpy' 'python-pyqt5' 'python-psutil' 'python-qdarkstyle')
optdepends=('python-pystray: for developers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/srevinsaju/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('29dbf3ced5a7c661aae0e559c66330e3b0c4abcb5c74937e8f1981c60ce6aacc'
            'b9f2925be19119950b8fa5099ff81c7368e51f1973d6f2528abe702087e6e5e0'
            '21a9e0f6a38db03cbe84d6498519bd79d66796f47cd6a738133f38a45ea4bb42')

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/opt/$pkgname"
	cp -r "$pkgname/"* "$pkgdir/opt/$pkgname/"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "installers/linux/icons/${pkgname}_logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
