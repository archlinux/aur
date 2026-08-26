# Maintainer: igaurab <dev@igaurab.com>
pkgname=sidetab-bin
_pkgname=sidetab
pkgver=0.2.3
pkgrel=1
pkgdesc="A Contexts-style window switcher sidebar for Hyprland (prebuilt binary)"
arch=('x86_64')
url="https://github.com/igaurab/sidetab"
license=('MIT')
# libbsd is not in the source package's list: it comes from the Ubuntu 22.04
# libxcb/libXdmcp this binary is linked against, and Arch only has it if
# something else (smbclient, talloc) already pulled it in. libmd follows it.
depends=('hyprland' 'vulkan-icd-loader' 'wayland' 'libxkbcommon' 'fontconfig' 'libbsd')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!debug !strip)
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8519ea2d9f826c53d7838e43f304ab9419ee914facaab79930281d845b766763')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/assets/$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
  install -Dm644 "$srcdir/assets/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
