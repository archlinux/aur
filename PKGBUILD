# Maintainer: xpufx <github@xpufx.com>
pkgname="paseo-desktop-bin-edge"
pkgver=0.7.1
_deb_sha='6c624c379f4a2621c03b0bd522e80b7d36db19a650a65e971f21306ba0b39cff'
pkgrel=1
pkgdesc="One interface for all your Claude Code, Codex and OpenCode agents. (edge - latest upstream release, beta or stable)"
arch=("x86_64")
url="https://paseo.sh"
_github_url="https://github.com/getpaseo/paseo"
makedepends=("binutils" "tar")
depends=(libxkbcommon libxcb libgcc gtk3 libxext libx11 libcups nspr mesa dbus pango libxcomposite libxrandr nodejs glib2 nss libxdamage alsa-lib systemd-libs bash hicolor-icon-theme cairo at-spi2-core expat libstdc++ libxfixes)
provides=("paseo=${pkgver}")
conflicts=(paseo paseo-bin paseo-appimage paseo-desktop-bin paseo-desktop-bin-beta)
license=("Apache-2.0")
source=("${_github_url}/releases/download/v${pkgver//_/-}/Paseo-${pkgver//_/-}-amd64.deb")
sha256sums=("$_deb_sha")

prepare() {
        ar p Paseo-${pkgver//_/-}-amd64.deb data.tar.xz | tar --zstd -x
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
        cp -R opt ${pkgdir}
}
