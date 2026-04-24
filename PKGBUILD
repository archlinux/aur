# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="alma-desktop-bin"
pkgver="0.0.768"
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
sha256sums=('4b1b3ec0bf35576664c507ed5fbd0b001eeadaf43f4a6d55f4bc296a7e840f2f')

prepare() {
        ar p alma-${pkgver}-linux-amd64.deb data.tar.xz | tar --zstd -x
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
        cp -R opt ${pkgdir}
}
