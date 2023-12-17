# Maintainer: Twann <tw4nn at disroot.org>

pkgname=tblock-gui
pkgver=1.3.4
pkgrel=2
provides=("$pkgname")
pkgdesc="Official graphical user interface for the TBlock content blocker"
url="https://tblock.me"
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
        "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock-gui/archive/${pkgver}.tar.gz"
)
sha512sums=(
	"a222e22fbb25cfd520aa12a48349eab741d77fc471ec17a3e65dfb9be1864e758606daa6d7368e52d9f1568cb8c5817b273ede0e4fec77da3e964e44919c7e00"
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
