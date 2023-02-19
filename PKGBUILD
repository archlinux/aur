# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=ptt-fix
pkgver=0.3.0
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
sha256sums=('c03f6536ca65a7786ebe6daebbf2e3468a78613cfcdacf3429fa564003709dd8')

build() {
	cd "$pkgname-$pkgver"
	go build -v -x -trimpath -o ptt-fix .
}

package() {
	cd "$pkgname-$pkgver"
	install -D ptt-fix "$pkgdir/usr/bin/ptt-fix"
}

# vim: ts=2 sw=2 et
