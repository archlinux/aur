# Maintainer: Patrick Li <aur@patrickli.one>
pkgname=unbill-nightly-bin
pkgver=nightly.20260614.025329
pkgrel=1
pkgdesc="Desktop app for unbill (nightly)"
arch=('x86_64')
url="https://github.com/unbill-project/unbill"
license=('MIT' 'Apache-2.0')
depends=('unbill-daemon-nightly' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
provides=('unbill')
conflicts=('unbill-bin')
_tag=nightly-20260614-025329
source_x86_64=("https://github.com/unbill-project/unbill/releases/download/${_tag}/unbill-linux-x86_64.deb")
sha256sums_x86_64=('SKIP')

package() {
    cd "$srcdir"
    ar x unbill-linux-x86_64.deb
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
