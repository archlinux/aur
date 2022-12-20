# Maintainer: Twann <tw4nn at disroot.org>

pkgname=tblock-gui
pkgver=1.2.0.beta
pkgrel=1
_bin_ver=1.2.0
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
        "ee7051c81f7fb1c71619f7ee2af13638e5358465f4df62bffceb7d6844e4c054e60f364a2a0ce0adbdce79a92f9ce229293914d6be2929e7a354dff03a2c7c1f"
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
