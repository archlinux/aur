# Maintainer: BeeJay
pkgname=sidequest
pkgver=0.3.4
pkgrel=1
pkgdesc="Easily sideload apps onto your standalone android VR headset"
arch=('x86_64')
url="https://github.com/the-expanse/SideQuest"
license=('MIT')
groups=()
depends=(gtk3 libxss nss)
makedepends=()
provides=("${pkgname}")
backup=()
options=()
install=
source=("https://github.com/the-expanse/SideQuest/releases/download/${pkgver}/SideQuest-linux-x64.tar.gz")
noextract=()
md5sums=('cd58ea36d26d7fd5229913ab54921b1c')

package() {
	cd "$srcdir/SideQuest-linux-x64"

	install -dm755 "$pkgdir/opt/$pkgname"
	cp -r -t "$pkgdir/opt/$pkgname" .

	install -dm755 "$pkgdir/usr/bin"
	ln -s /opt/${pkgname}/SideQuest "$pkgdir/usr/bin/sidequest"

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
