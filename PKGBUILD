# Maintainer: Shayne Hartford <shayneehartford@gmail.com>
pkgname=sharexin
_pkgname=ShareXin
pkgver=0.7.2
pkgrel=2
pkgdesc="ShareX for Linux and BSD"
arch=('any')
url="https://github.com/ShareXin/ShareXin"
license=('GPL3')
depends=(
    'cairo'
    'curl'
    'gtk3'
    'gdk-pixbuf2'
    'glib2'
    'openssl'
    'dbus'
    'xcb-util'
)
makedepends=(
    'cargo'
    'clang'
)
optdepends=(
    'gnome-screenshot: Screenshot support with Gnome'
    'spectacle: Screenshot support with KDE'
    'scrot: Screenshot support with general X11'
)
source=(https://github.com/$_pkgname/$_pkgname/archive/$pkgver.tar.gz)
md5sums=('fe8e5d9235aa1efc0b37bec19d9ab3ce')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
