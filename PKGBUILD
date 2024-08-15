# Maintainer: Dee.H.Y <dongfengweixiao AT hotmail DOT com>
pkgname=flclash-bin
_pkgname=flclash
pkgver=0.8.53
pkgrel=1
pkgdesc="A multi-platform proxy client based on ClashMeta,simple and easy to use, open-source and ad-free."
arch=('x86_64')
url="https://github.com/chen08209/FlClash"
license=('GPL-3.0 license')
conflicts=("flclash-git" "flclash")
install="flclash.install"
depends=(libayatana-appindicator cairo at-spi2-core hicolor-icon-theme libdbusmenu-glib gtk3 libepoxy pango gdk-pixbuf2 harfbuzz fontconfig libayatana-indicator ayatana-ido glib2 glibc gcc-libs)
source=(
	"${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
)
sha256sums=('c4add83ca2dab9eb3e1ba05f1614c28c26ab83f5551174428b2bc30e46306cfb')

package() {
    msg "Converting debian package..."
    cd "$srcdir"
    tar -I zstd -xvf data.tar.zst -C "$pkgdir"
    find "$pkgdir" -type d -exec chmod 755 {} \;
}
