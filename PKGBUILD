# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="paseo-desktop-bin"
pkgver="0.1.110"
pkgrel=1
pkgdesc="One interface for all your Claude Code, Codex and OpenCode agents."
arch=("x86_64")
url="https://paseo.sh"
_github_url="https://github.com/getpaseo/paseo"
makedepends=("binutils" "tar")
depends=(libxkbcommon libxcb libgcc gtk3 libxext libx11 libcups nspr mesa dbus pango libxcomposite libxrandr nodejs glib2 nss libxdamage alsa-lib systemd-libs bash hicolor-icon-theme cairo at-spi2-core expat libstdc++ libxfixes)
provides=("paseo=${pkgver}")
conflicts=(paseo paseo-bin paseo-appimage)
license=("AGPL-3.0-only")
source=("${_github_url}/releases/download/v${pkgver}/Paseo-${pkgver}-amd64.deb")
sha256sums=('e63c47cfbc7b618a2b7cf6450b6d467916b9b690f8d6055f70c7a23ea33543be')

prepare() {
        ar p Paseo-${pkgver}-amd64.deb data.tar.xz | tar --zstd -x
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
        cp -R opt ${pkgdir}
}
