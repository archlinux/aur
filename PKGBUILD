# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="alma-desktop-bin"
pkgver="0.0.675"
pkgrel=1
pkgdesc="A beautiful desktop application that unifies your AI experience. Seamlessly switch between OpenAI, Anthropic, Google Gemini, and custom providers."
arch=("x86_64")
url="https://alma.now"
_github_url="https://github.com/yetone/alma-releases"
makedepends=("binutils" "tar")
depends=(libxcomposite nss libxdamage nodejs libxfixes libxext gcc-libs pango expat cairo vulkan-icd-loader nspr libxcb dbus glibc gtk3 libx11 bash at-spi2-core mesa alsa-lib glib2 libxrandr hicolor-icon-theme python libcups libxkbcommon systemd-libs java-runtime)
provides=("alma=${pkgver}")
conflicts=(alma-appimage)
license=("LicenseRef-custom")
source=("${_github_url}/releases/download/v${pkgver}/alma-${pkgver}-linux-amd64.deb")
sha256sums=('6d3c6868927e1be9d6d3cd166643d01152dc9b5f83d8479bfca7e6e63851c79e')

prepare() {
        ar p alma-${pkgver}-linux-amd64.deb data.tar.xz | tar --zstd -x
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
        cp -R opt ${pkgdir}
}
