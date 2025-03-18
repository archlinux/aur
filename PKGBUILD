# Maintainer: Christopher Schnick <crschnick@xpipe.io>

_fullver="15.7"
pkgname="xpipe"
pkgver="15.7"
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
sha256sums_x86_64=("057501a9211ad313d82de9f59ab2af599e8f614ec4e96c5cdbb041879c67a450")
sha256sums_aarch64=("6ec5da9e2e0271f6c33bf9c9cd42aab443081c6530b7c55372e74e17b32ef6d7")

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
