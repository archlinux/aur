# Maintainer: S.EE Team <dev@s.ee>
# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=see-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A native GNOME desktop client for S.EE URL shortening service (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/sdotee/desktop"
license=('MIT')
depends=('gtk4' 'libadwaita' 'cairo' 'pango' 'gdk-pixbuf2' 'glib2')
provides=('see')
conflicts=('see')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/see_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/see_${pkgver}_arm64.deb")
sha256sums_x86_64=('e98ed9a8175e39343f582092a3558567f31413073b92e9d95349c8222f55fad0')
sha256sums_aarch64=('a6d524697c6fe61f79924a6a7672ffdb0ad37fed7ce03e69e223c8eb8899cecf')

package() {
    cd "$srcdir"

    # Extract deb package
    bsdtar -xf data.tar.*

    # Install files
    install -Dm755 "usr/bin/see" "$pkgdir/usr/bin/see"
    install -Dm644 "usr/share/applications/ee.s.app.desktop" "$pkgdir/usr/share/applications/ee.s.app.desktop"
    install -Dm644 "usr/share/metainfo/ee.s.app.metainfo.xml" "$pkgdir/usr/share/metainfo/ee.s.app.metainfo.xml"
    install -Dm644 "usr/share/icons/hicolor/scalable/apps/ee.s.app.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/ee.s.app.svg"
    install -Dm644 "usr/share/glib-2.0/schemas/ee.s.app.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/ee.s.app.gschema.xml"
}
