# Maintainer: BeeJay
pkgname=sidequest-bin
_pkgname=sidequest
pkgver=0.8.7
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
md5sums=('4f448350f8a382efbb94e9072a3dfe46')

package() {
	cd "$srcdir/SideQuest-${pkgver}"

	install -dm755 "$pkgdir/opt/$_pkgname"
	cp -r -t "$pkgdir/opt/$_pkgname" .

	install -dm755 "$pkgdir/usr/bin"
	ln -s /opt/$_pkgname/sidequest "$pkgdir/usr/bin/sidequest"

    install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE*
}
