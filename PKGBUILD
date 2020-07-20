# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: BeeJay

pkgname=sidequest-bin
_pkgname=sidequest
pkgver=0.10.11
pkgrel=1
pkgdesc="Easily sideload apps onto your standalone android VR headset"
arch=('x86_64')
url="https://github.com/the-expanse/SideQuest"
license=('MIT')
depends=(gtk3 libxss nss)
conflicts=("$_pkgname")
source=("https://github.com/the-expanse/SideQuest/releases/download/v${pkgver}/SideQuest-${pkgver}.tar.xz")
md5sums=('ef447b5b9fbd0f518a3719c0e6b0af74')

package() {
	cd "$srcdir/SideQuest-${pkgver}"

	install -dm755 "$pkgdir/opt/$_pkgname"
	cp -r -t "$pkgdir/opt/$_pkgname" .

	install -dm755 "$pkgdir/usr/bin"
	ln -s /opt/$_pkgname/sidequest "$pkgdir/usr/bin/sidequest"

    install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE*
}
