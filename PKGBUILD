# Maintainer: Camelia Lavender <cam at camelia dot dev>

pkgname=tblock-gui
pkgver=1.3.6
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
	"76aa12b64f3c65aade3248e02ca447a181ec7b87eb9c580b223b479c12b20827cb128b5851c8223d2291e1a89240e7c607cbea80e1b02bd7e3b90c3f45a15748"
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
