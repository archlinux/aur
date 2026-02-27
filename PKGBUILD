# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="irbox-bin"
pkgver="1.0.2"
pkgrel=1
pkgdesc="A versatile proxy client supporting multiple protocols including VLESS, VMess, Shadowsocks, Trojan, Hysteria2, and TUIC with advanced management features, subscription support, routing rules, and system proxy/TUN modes"
arch=("x86_64")
url="https://github.com/frank-vpl/IRBox/discussions"
_github_url="https://github.com/frank-vpl/IRBox"
makedepends=("binutils" "tar")
depends=(gcc-libs cairo libsoup3 hicolor-icon-theme webkit2gtk-4.1 glib2 gtk3 glibc gdk-pixbuf2)
provides=("irbox=${pkgver}")
conflicts=(irbox sing-box-bin)
license=("GPL-3.0-only")
source=("${_github_url}/releases/download/v${pkgver}/IRBox_${pkgver}_amd64.deb")
sha256sums=('4ee4bec040d5e68be51a8f6202a0b7f0dd13c43e38fd340537c15cd1d7221059')

prepare() {
        ar p IRBox_${pkgver}_amd64.deb data.tar.gz | tar --zstd -x
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
}
