# Maintainer: Christopher Schnick <crschnick@xpipe.io>

_fullver="15.0.2"
pkgname="xpipe"
pkgver="15.0.2"
pkgrel="1"
epoch=1
pkgdesc="Your entire server infrastructure at your fingertips"
arch=('x86_64' 'aarch64')
url="https://github.com/xpipe-io/${pkgname}"
license=('unknown')
groups=()
# From https://aur.archlinux.org/packages/java-openjfx
depends=(
  cairo
  freetype2
  gdk-pixbuf2
  glib2
  gperf
  gtk3
  libgl
  libx11
  libxtst
  pango
  util-linux
  socat
  hicolor-icon-theme
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug !strip)
install=
changelog="${pkgname}.changelog"
source=("logo_48x48.png" "logo_256x256.png" "${pkgname}.desktop")
source_x86_64=("${pkgname}-${_fullver}-x86_64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${_fullver}-arm64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-arm64.tar.gz")
noextract=()
sha256sums=("SKIP" "SKIP" "SKIP")
sha256sums_x86_64=("96dc1a84a9e3b03e3bceae426aae2a7dbf1473a2efb208b38e2127e2f6b67912")
sha256sums_aarch64=("865ee2c009190af76221b1d043f77c5443f53d465a43edd28fe2a541b867c700")

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "$srcdir/xpipe-${_fullver}" "$pkgdir/opt/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"
	install -d "$pkgdir/usr/share/icons/hicolor/48x48/apps"
	cp -a "$srcdir/logo_48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
	install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	cp -a "$srcdir/logo_256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/bin/xpipe" "$pkgdir/usr/bin/${pkgname}"
}
