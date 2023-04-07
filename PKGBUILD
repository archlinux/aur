# Maintainer: Twann <tw4nn at disroot.org>

pkgname=tblock-gui
pkgver=1.3.0.beta
pkgrel=1
_bin_ver=1.3.0
_build_type=beta
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
        "df6d6dd962a919c6f59870a5d8db6f2d796261a87d637204030aa3054b402c0ebd1a7dd76b78f11a81c3f96bf036723ddd379295629d2f2fb25cdc99fc6de3e5"
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
