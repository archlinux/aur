# Maintainer: Christopher Schnick <crschnick@xpipe.io>

_fullver="8.3"
pkgname="xpipe"
pkgver="8.3"
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
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog="${pkgname}.changelog"
source=("${pkgname}.desktop")
source_x86_64=("${pkgname}-${_fullver}-x86_64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${_fullver}-arm64.tar.gz::https://github.com/xpipe-io/${pkgname}/releases/download/${_fullver}/xpipe-portable-linux-arm64.tar.gz")
noextract=()
sha512sums=("SKIP")
sha512sums_x86_64=("SKIP")
sha512sums_aarch64=("SKIP")

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "$srcdir/xpipe-${_fullver}" "$pkgdir/opt/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"
	install -d "$pkgdir"/usr/bin
	ln -s "/opt/$pkgname/cli/bin/xpipe" "$pkgdir/usr/bin/${pkgname}"
	install -d "$pkgdir"/etc/bash_completion.d
	ln -s "/opt/$pkgname/cli/xpipe_completion" "$pkgdir/etc/bash_completion.d/${pkgname}"
}
