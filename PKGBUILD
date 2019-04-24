# Maintainer: Shayne Hartford <shayneehartford@gmail.com>
pkgname=sharexin-git
_pkgname=ShareXin
pkgver=0.7.2
pkgrel=3
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
provides=('sharexin')
conflicts=('sharexin')
source=(git+https://github.com/ShareXin/$pkgname.git)
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}
