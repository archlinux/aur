# Maintainer: Your Name <youremail@domain.com>

pkgname=x11spice
pkgver=1.1
pkgrel=1
pkgdesc="Connects a running X server as a Spice server."
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/spice/x11spice"
license=(GPL3)
depends=(spice gtk3 xorg-util-macros)
makedepends=(spice-protocol git libxcb xcb-util gtk3 xf86-video-qxl libcacard)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("$pkgname-$pkgver::git+https://gitlab.freedesktop.org/spice/x11spice")
noextract=()
md5sums=('SKIP')

pkgver()
{
    echo $pkgver
}

check()
{
    echo "Skipped"
}

prepare()
{
    echo "Prepare"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

