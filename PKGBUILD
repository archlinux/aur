
pkgname=trgui-ng-bin
_pkgname=trgui-ng
pkgver=1.4.0
pkgrel=1
pkgdesc='Remote GUI for Transmission torrent daemon'
arch=('x86_64')
url=https://github.com/openscopeproject/TrguiNG
license=('AGPL-3.0-only')
conflicts=('trgui-ng' 'trgui-ng-git')
depends=(dbus libsoup gcc-libs glib2 hicolor-icon-theme glibc openssl gtk3 alsa-lib webkit2gtk cairo gdk-pixbuf2 fontconfig)
source=(
	"${pkgname%-bin}-${pkgver}.deb::https://github.com/openscopeproject/TrguiNG/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums=('ec48343e15dde3bc0088f5c99eb49210d2d3eae5c117b8b612bcc97972342bf7')

package() {
    msg "Converting debian package..."
    cd "$srcdir"
    tar xvf data.tar.gz -C "$pkgdir"
    msg "Fix permissions for files and folders..."
    find "$pkgdir" -type d -exec chmod 755 {} \;
    find "$pkgdir" -type d -exec chown 0:0 {} \;
    find "$pkgdir" -type f -exec chown 0:0 {} \;
}
