# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=anytoggle
pkgver=0.r3.61130f4
pkgrel=1
pkgdesc="Toggle any program with a single shortcut"
arch=('x86_64' 'i686')
license=('GPL3')
url=('https://github.com/winged/anytoggle')
depends=('wmctrl' 'xdotool')
provides=('anytoggle')
conflicts=()

source=("$pkgname::git://github.com/winged/anytoggle.git"
        "LICENSE::https://raw.githubusercontent.com/winged/anytoggle/master/LICENSE")
sha256sums=('SKIP' 'SKIP')
pkgver() {
  cd "${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  if [ ! -d "$pkgdir/usr/bin" ]; then
    mkdir -p "$pkgdir/usr/bin"
  fi
  install anytoggle "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
