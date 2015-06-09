# Maintainer: Hugo Rodrigues <hugorodrigues at openmailbox dot com>

pkgname=toggle-input-git
pkgver=1.0.2
pkgrel=1
pkgdesc="Enable and disable xorg input devices in a easy and clean way"
arch=('any')
url="https://github.com/Hugao/ToggleInput"
license=('GPL3')
groups=('xorg-apps')
depends=('grep' 'xorg-xinput' 'bash')
optdepends=('libnotify: For desktop notifications')
makedepends=('git')
conflicts=('toggle-input')
provides=('toggle-input')
source=("git://github.com/Hugao/ToggleInput.git")
md5sums=('SKIP')

prepare() {
	cd $srcdir/ToggleInput/
	git checkout tags/v$pkgver-$pkgrel
}

package() {
	install -Dm755 "$srcdir/ToggleInput/src/toggleinput.sh" "$pkgdir/usr/bin/toggleinput"
	install -Dm644 "$srcdir/ToggleInput/src/toggleinput-disable.png" "$pkgdir/usr/share/pixmaps/toggleinput-disable.png"
	install -Dm644 "$srcdir/ToggleInput/src/toggleinput-enable.png" "$pkgdir/usr/share/pixmaps/toggleinput-enable.png"
}
