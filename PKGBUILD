# PACKAGE'S NAME : torbrowser-launcher-arm64
# PACKAGE'S DESCRIPTION
#    Tor Browser installer for ARM64
# PACKAGE"S CREATOR : MrX

# PACKAGE'S INFORMATION
pkgname=torbrowser-launcher-arm64
pkgver=12.5.2
pkgrel=1
pkgdesc="Tor Browser installer for ARM64"

# PACKAGE'S ARCHITECTURE
arch=("aarch64")

# PACKAGE'S BASE URL
url="https://www.torproject.org"

# PACKAGE'S LICENSE
license=("GPL")

# PACKAGE'S DEPENDENCIES
depends=("libxt" "startup-notification" "mime-types" "dbus-glib"
	 "alsa-lib" "desktop-file-utils" "hicolor-icon-theme"
	 "libvpx" "icu" "libevent" "nss" "hunspell" "sqlite")

# PACKAGE'S OPTIONAL DEPENDENCIES
optdepends=("zenity: simple dialog boxes"
	    "kdialog: KDE dialog boxes"
	    "gst-plugins-good: H.264 video"
	    "gst-libav: H.264 video"
	    "libpulse: PulseAudio audio driver"
	    "libnotify: Gnome dialog boxes")

# PACKAGE'S SOURCE
source=("https://freefr.dl.sourceforge.net/project/tor-browser-ports/${pkgver}/tor-browser-linux-arm64-${pkgver}_ALL.tar.xz")

# PACKAGE'S SHA256 SUM
sha256sums=("23481fbae924cc8f572c07befa9c9c4991879e3d3c29991b80b87720cecfcec6")

# PACKAGE'S CREATION
package() {
    # PACKAGE'S CONTENT FOLDERS
    install -d "$pkgdir/usr/share/torbrowser-launcher"
    install -d "$pkgdir/usr/bin"

    # PACKAGE'S FILL
    mv "$srcdir/tor-browser/"* "$pkgdir/usr/share/torbrowser-launcher/"

    # PACKAGE'S LINK
    ln -s "$pkgdir/usr/share/torbrowser-launcher/Browser/start-tor-browser" "$pkgdir/usr/bin/torbrowser-launcher"
}
