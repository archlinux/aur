# Maintainer: xpufx <github@xpufx.com>
pkgname="paseo-desktop-bin-beta"
pkgver=0.7.0_beta.3
pkgrel=1
pkgdesc="One interface for all your Claude Code, Codex and OpenCode agents. (beta)"
arch=("x86_64")
url="https://paseo.sh"
_github_url="https://github.com/getpaseo/paseo"
makedepends=("binutils" "tar")
depends=(libxkbcommon libxcb libgcc gtk3 libxext libx11 libcups nspr mesa dbus pango libxcomposite libxrandr nodejs glib2 nss libxdamage alsa-lib systemd-libs bash hicolor-icon-theme cairo at-spi2-core expat libstdc++ libxfixes)
provides=("paseo=${pkgver}")
conflicts=(paseo paseo-bin paseo-appimage paseo-desktop-bin)
license=("Apache-2.0")
source=("${_github_url}/releases/download/v0.7.0-beta.3/Paseo-0.7.0-beta.3-amd64.deb")
sha256sums=('82e172b6d6bd9ce3bd9dc2355c90ba606415cb824151deda37cda4bb2778a2f2')

prepare() {
        ar p Paseo-0.7.0-beta.3-amd64.deb data.tar.xz | tar --zstd -x
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
        cp -R opt ${pkgdir}
}
