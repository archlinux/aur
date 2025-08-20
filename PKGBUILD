pkgname=prism-wm-git
pkgver=1.0.0
pkgrel=3
pkgdesc="Prism - A minimal tiling window manager"
arch=('x86_64')
url="https://github.com/FedGuy699/PrismWM"
license=('custom')
depends=('xorg-server' 'libx11' 'libxext' 'libxrandr' 'freetype2' 'libxft')
makedepends=('git' 'gcc')
provides=('prismwm')
conflicts=('prismwm')
source=("git+https://github.com/FedGuy699/PrismWM.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/PrismWM"
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/PrismWM"
  make
}

package() {
  cd "$srcdir/PrismWM"
  install -Dm755 prismwm "$pkgdir/usr/local/bin/prismwm"
  install -Dm644 prismwm.desktop "$pkgdir/usr/share/xsessions/prismwm.desktop"
}

