# Maintainer: Dominik <dominik@dmpk.xyz>
pkgname=rofi-passmenu
pkgver=2.e00607b
pkgrel=1
pkgdesc="A script to copy passwords from pass with rofi."
arch=('any')
url="https://github.com/D00NIK/rofi-passmenu"
license=('GPL-2.0-only')
source=("git+https://github.com/D00NIK/rofi-passmenu")
depends=('rofi' 'pass')
optdepends=('wl-clipboard: for clipboard support on Wayland'
            'xclip: for clipboard support on X11'
            'xdotool: to type passwords'
            'ydotool: to type passwords on Wayland')
makedepends=('git')

pkgver() {
	cd $pkgname;
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

md5sums=('SKIP')
