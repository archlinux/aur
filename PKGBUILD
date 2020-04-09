# Maintainer: BeeJay
pkgname=sidequest-bin
_pkgname=sidequest
pkgver=0.10.2
pkgrel=1
pkgdesc="Easily sideload apps onto your standalone android VR headset"
arch=('x86_64')
url="https://github.com/the-expanse/SideQuest"
license=('MIT')
groups=()
depends=(gtk3 libxss nss)
makedepends=()
conflicts=("$_pkgname")
backup=()
options=()
install=
source=("https://github.com/the-expanse/SideQuest/releases/download/v${pkgver}/SideQuest-${pkgver}.tar.xz")
noextract=()
md5sums=('1a4e54ea785c7ab215245523acd18e76')

package() {
	cd "$srcdir/SideQuest-${pkgver}"

	install -dm755 "$pkgdir/opt/$_pkgname"
	cp -r -t "$pkgdir/opt/$_pkgname" .

	install -dm755 "$pkgdir/usr/bin"
	ln -s /opt/$_pkgname/sidequest "$pkgdir/usr/bin/sidequest"

    install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE*
}
