# Maintainer: Twann <tw4nn at disroot.org>

pkgname=tblock-gui
pkgver=1.3.2.rc.1
pkgrel=2
_bin_ver=1.3.2
_build_type=rc.1
provides=("$pkgname")
pkgdesc="Official graphical user interface for the TBlock content blocker"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=(
        "make"
        "python>=3"
        "python-setuptools"
        "git"
	"gettext"
)
depends=(
        "gtk3"
	"glib2"
        "python-gobject"
        "hicolor-icon-theme"
        "coreutils"
        "tblock"
	"polkit"
)
source=(
        "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock-gui/archive/${_bin_ver}-${_build_type}.tar.gz"
)
sha512sums=(
	"4dd22e6f39d49fe4e80881b4fb25ec269081e652133a0c3e34c293901b15bb7a9dbc0ba124a4b5df58480b8fa483f71b8078831399aab38679e0adfa5f1ef947"
)

build()
{
        cd "$srcdir/$pkgname"
        make
}

package()
{
        cd "$srcdir/$pkgname"
        # Install the package
        make install ROOT="$pkgdir"
}
