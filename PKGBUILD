# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=ptt-fix
pkgver=0.2.1
pkgrel=2
pkgdesc="A somewhat hacky workaround for push-to-talk in Discord and other apps in Wayland."
arch=(i686 x86_64)
url="https://github.com/DeedleFake/ptt-fix"
license=('MIT')
depends=(xdotool)
makedepends=('go>=2:1.20')
optdepends=()
provides=()
source=("https://github.com/DeedleFake/ptt-fix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('715e236483faa4d8ee39d4874f07b8adca4e2ff5a1e7ee9bf4c00b92a949c023')

build() {
	cd "$pkgname-$pkgver"
	go build -v -x -trimpath -o ptt-fix .
}

package() {
	cd "$pkgname-$pkgver"
	install -D ptt-fix "$pkgdir/usr/bin/ptt-fix"
}

# vim: ts=2 sw=2 et
