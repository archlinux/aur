# Maintainer: Dee.H.Y <dongfengweixiao AT hotmail DOT com>
pkgname=flclash-bin
_pkgname=flclash
pkgver=0.8.57
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
sha256sums=('8ba43b8256308f50bac26c6b7ea052e285e90a981baa029c1b52dcba913bfa7d')

package() {
    msg "Converting debian package..."
    cd "$srcdir"
    tar -I zstd -xvf data.tar.zst -C "$pkgdir"
    find "$pkgdir" -type d -exec chmod 755 {} \;
}
