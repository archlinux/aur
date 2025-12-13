
pkgname=trgui-ng-bin
_pkgname=TrguiNG
pkgver=1.5.1
pkgrel=1
pkgdesc='Remote GUI for Transmission torrent daemon'
arch=('x86_64')
url=https://github.com/openscopeproject/TrguiNG
license=('AGPL-3.0-only')
conflicts=('trgui-ng' 'trgui-ng-git')
depends=(dbus libsoup3 gcc-libs glib2 hicolor-icon-theme glibc openssl gtk3 alsa-lib webkit2gtk-4.1 cairo gdk-pixbuf2 fontconfig)
source=(
	"${pkgname%-bin}-${pkgver}.deb::https://github.com/openscopeproject/TrguiNG/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums=('f783ddd83e837b6175f44b3fcc1785eb901d2886bd762ea9a75b535c5782cc48')

package() {
    msg "Converting debian package..."
    cd "$srcdir"
    tar xvf data.tar.gz -C "$pkgdir"
    msg "Fix permissions for files and folders..."
    find "$pkgdir" -type d -exec chmod 755 {} \;
    find "$pkgdir" -type d -exec chown 0:0 {} \;
    find "$pkgdir" -type f -exec chown 0:0 {} \;
}
