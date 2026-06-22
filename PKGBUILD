# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="skiff-bin"
pkgver="1.0.0"
pkgrel=1
pkgdesc=" Skiff is a local cross-platform disk cleanup tool for inspecting caches, applications, duplicate files, and large files before removal."
arch=("x86_64")
url="https://github.com/DrizzleTime/Skiff"
_github_url="https://github.com/DrizzleTime/Skiff"
makedepends=("binutils" "tar")
depends=(libsoup3 dbus gdk-pixbuf2 glib2 cairo webkit2gtk-4.1 hicolor-icon-theme gtk3 libgcc glibc)
provides=("skiff=${pkgver}")
conflicts=(skiff skiff-appimage)
license=()
source=("${_github_url}/releases/download/v${pkgver}.beta.1/skiff_${pkgver}_amd64.deb")
sha256sums=('8ca4d5bbcbee9a3a8351bbd45c253b8600d0092bfde8bed350a0794299528450')

prepare() {
        ar p skiff_${pkgver}_amd64.deb data.tar.gz | tar --zstd -x
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
}
