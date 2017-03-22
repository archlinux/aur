# Contributor: archtux <antonio dot arias99999 at gmail dot com>
# Maintainer: SanskritFritz (gmail)

pkgname=orthorobot
pkgver=1.1.1
pkgrel=1
pkgdesc='Perspective based puzzle game, where you flatten the view to move across gaps.'
arch=('i686' 'x86_64')
url="http://stabyourself.net/orthorobot/"
license=('WTFPL')
depends=('love')
makedepends=('zip')
source=("https://github.com/Stabyourself/orthorobot/archive/v$pkgver.tar.gz"
        "http://stabyourself.net/images/site/banner-orthorobot.png"
        "$pkgname.sh"
        "$pkgname.desktop")
md5sums=('36f0b2e8cb8cd1e5770bfb84e4e77eaf'
         '357045580e02e973b0c9ae10399657d5'
         '812e34d73ee0405f1fff5568b2565d89'
         'd9d6a95c1382beb2ec3e75d85206eadb')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	zip --recurse-paths "$pkgname.love" .
	install -Dm644 "$pkgname.love" "$pkgdir/usr/share/$pkgname/$pkgname.love"

	cd "$srcdir"
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "banner-orthorobot.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
