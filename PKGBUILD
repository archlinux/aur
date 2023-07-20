# Maintainer: Twann <tw4nn at disroot.org>

pkgname=tblock-gui
pkgver=1.3.3
pkgrel=1
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
	"7dae7f810aeaf33492cf67f4400938765b2b9f75cd0723a0b5291390134d151bcd7b942b349e76f6647338ebd104d4b75bdbfcebb208b7219c2214292b4d5612"
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
