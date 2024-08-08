
pkgname=biyi-bin
_pkgname=biyi
pkgver=0.5.0
_pkgver=18
pkgrel=2
pkgdesc="a convenient translation and dictionary app written in Flutter."
arch=('x86_64')
url="https://biyidev.com"
license=('AGPL-3.0-only')
conflicts=("biyi-git")
install="biyi.install"
depends=(
    libappindicator-gtk3 libdbusmenu-glib gst-plugins-base-libs gstreamer libkeybinder3
)

source=(
	"${pkgname%-bin}-${pkgver}.deb::https://github.com/lijy91/biyi/releases/download/v${pkgver}/${_pkgname}-${pkgver}+${_pkgver}-linux.deb"
)
sha256sums=('9cf84332c7894ab849e19ffeec34bf13aa2c0afee2fc529fe0b1aed6e7aefebb')

package() {
    msg "Converting debian package..."
    cd "$srcdir"
    tar Jxpf data.tar.xz -C "$pkgdir"
    find "$pkgdir" -type d -exec chmod 755 {} \;
}
