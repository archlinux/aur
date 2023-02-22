# Maintainer: DeedleFake <deedlefake@users.noreply.github.com>

pkgname=ptt-fix
pkgver=0.7.0
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
sha256sums=('8d303630485a2609b89a5a241b29956e184d941c979aa466f43f4469fb66f37e')

build() {
	cd "$pkgname-$pkgver"
	go build -v -x -trimpath -o ptt-fix .
}

package() {
	cd "$pkgname-$pkgver"
	install -D ptt-fix "$pkgdir/usr/bin/ptt-fix"
  install -D ptt-fix.service "$pkgdir/usr/lib/systemd/user/ptt-fix.service"
}

# vim: ts=2 sw=2 et
