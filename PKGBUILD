# Maintainer: Twann <tw4nn at disroot.org>

pkgname=tblock-gui
pkgver=1.3.4
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
	"f0f6a0d5ea09da188cd3a2dfe432e63f6a614eae94155f0da39c8d0fdd92eff604b100222c369a308eb1d4b923d5214b5026e6ae67518d8697c9c27f3078d528"
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
