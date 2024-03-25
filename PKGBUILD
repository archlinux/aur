# Davide Depau <davide@depau.eu>

_pkgname=easybashgui
pkgname=$_pkgname-git
pkgver=13.0.0.r0.ga716a78
pkgrel=1
pkgdesc="Bash function library to have simple GUIs using dialog, yad, zenity, kdialog, xdialog, gtkdialog"
arch=('any')
depends=('bash')
makedepends=('git' 'make')
optdepends=(
    'dialog: ncurses-based TUI dialog'
    'libnewt: whiptail TUI dialog'
    'yad: GTK dialog'
    'gtkdialog: GTK dialog'
    'zenity: GTK dialog'
    'xdialog: GTK dialog'
    'kdialog: KDE/Qt5 dialog'
)
url="https://github.com/BashGui/easybashgui"
license=('GPL-3.0-only')
source=(${_pkgname}::git+https://github.com/BashGui/easybashgui.git)
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
