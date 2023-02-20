# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=ptt-fix
pkgver=0.5.1
pkgrel=1
pkgdesc="A somewhat hacky workaround for push-to-talk in Discord and other apps in Wayland."
arch=(i686 x86_64)
url="https://github.com/DeedleFake/ptt-fix"
license=('MIT')
depends=(xdotool)
makedepends=('go>=2:1.20')
optdepends=()
provides=()
source=("https://github.com/DeedleFake/ptt-fix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b2bf7d3eeb69c753ce63a42373c620b31047e54b1b2e57a81ec215ba53c33e04')

build() {
	cd "$pkgname-$pkgver"
	go build -v -x -trimpath -o ptt-fix .
}

package() {
	cd "$pkgname-$pkgver"
	install -D ptt-fix "$pkgdir/usr/bin/ptt-fix"
}

# vim: ts=2 sw=2 et
