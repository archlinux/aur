# Maintainer: X3n0m0rph59 <x3n0m0rph59@gmail.com>
pkgname=roccat-vulcan
pkgver=0.0.1
pkgrel=0
pkgdesc="Linux RGB LED effect support for the Roccat Vulcan 100/120/121 Keyboard"
arch=('i686' 'x86_64')
url="https://github.com/X3n0m0rph59/roccat-vulcan"
license=('GPL')
groups=()
depends=()
makedepends=('systemd-libs' 'hidapi' 'libevdev')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
changelog=
source=("git+https://github.com/X3n0m0rph59/roccat-vulcan")
noextract=()
md5sums=('SKIP')

build() {
  cd "$pkgname"/src

  make
}

package() {
  cd "$pkgname"/src

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/lib/udev/rules.d/"
  mkdir -p "$pkgdir/lib/systemd/user/"
    
  install -m 755 "roccat-vulcan" "$pkgdir/usr/bin/"
  install -m 644 "roccat-vulcan.service" "$pkgdir/lib/systemd/user/"
  install -m 644 "arch/70-roccat-vulcan.rules" "$pkgdir/lib/udev/rules.d/"
}
