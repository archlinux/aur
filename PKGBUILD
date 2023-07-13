# Maintainer: Daniel Maslowski <info@orangecms.org>

_appname=fiedka
pkgname=fiedka-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Fiedka the Firmware Editor"
arch=('x86_64')
url="https://fiedka.app"
license=('GPL3')
makedepends=('unzip')
provides=("${_appname}")
conflicts=("${_appname}")
install=
_dir="$_appname-linux-x64"
source=(
  "https://github.com/fiedka/$_appname/releases/download/v$pkgver/$_dir-$pkgver.zip"
)
sha256sums=('6a4e16eb1eea3b449e74ab2dcb9c42acb6d7174c8b0b5b3d20d1d540be5c2a54')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/opt/" "$pkgdir/usr/bin/"
  cp -a "$srcdir/${_dir}" "$pkgdir/opt/$_appname"
  ln -s "$pkgdir/opt/$_appname/$_appname" "$pkgdir/usr/bin/$_appname"
  # TODO: desktop file?
  #install -Dm 755 $_appname.desktop "$pkgdir/usr/share/applications/$_appname.desktop"
}
