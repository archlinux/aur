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
        "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock-gui/archive/fix-5-refactor-filterlists-activity.tar.gz"
)
sha512sums=(
        "582599700fa983c817a2bab94ea1a4a3ea9b3e41d090243e87e071e41718a7b6e4b5ffe401eca2f1a87f8119ab2342a07a02755801a6637e24b516e1084a844e"
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
