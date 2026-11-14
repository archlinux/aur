# Maintainer: simonlinuxcraft <simonlinuxcraft at users dot noreply dot github dot com>
# Contributor: Yilmaz4 <https://github.com/Yilmaz4>
pkgname=kyber-launcher-unofficial-appimage
pkgver=7.0.5_beta10
_appver=7.0.5-beta10
pkgrel=1
pkgdesc="Native binary build of the Kyber V2 mod launcher for Star Wars Battlefront II (2017). Not endorsed by the Kyber team."
arch=('x86_64')
url="https://github.com/simonlinuxcraft/kyber-linuxport-unofficial"
license=('GPL-3.0-only')
depends=('gtk3' 'mpv' 'ffmpeg' 'gstreamer' 'gst-plugins-base' 'gst-plugins-base-libs' 'libarchive' 'curl' 'zeromq' 'libsecret' 'libepoxy' 'librsvg' 'glib2' 'tinysparql' 'glycin' 'xdg-user-dirs')
conflicts=(kyber-launcher-inofficial-appimage)
replaces=(kyber-launcher-inofficial-appimage)
options=(!debug)
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v${_appver}/${pkgver}.tar.xz")
sha256sums=("be429eba0f2367d8794c8b389a25d789ce1c312339019a5c537f93444f9a9b33")

package() {
	cd "$srcdir/"
    cp -r usr opt "$pkgdir/"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf '../../opt/kyber/kyber_launcher' "$pkgdir/usr/bin/kyber_launcher"
}
