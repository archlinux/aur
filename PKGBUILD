# Maintainer: Judd <ipajudd at gmail dot com>
#
# Repackages the .deb from the GitHub release. .github/workflows/aur.yml sets
# pkgver, pkgrel and the checksums, then pushes this file to the AUR.

pkgname=pob-redux-bin
_pkgname=pob-redux
pkgver=0.4.47
pkgrel=1
pkgdesc="Path of Building for Path of Exile 1 and 2, rebuilt"
arch=('x86_64' 'aarch64')
url="https://pobredux.com"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'glib2' 'cairo' 'gdk-pixbuf2' 'dbus' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
optdepends=('gnome-keyring: store assistant API keys'
            'kwallet: store assistant API keys')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/pobredux/pob-redux/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64.deb::https://github.com/pobredux/pob-redux/releases/download/v$pkgver/PoB.Redux_${pkgver}_amd64.deb")
source_aarch64=("$_pkgname-$pkgver-aarch64.deb::https://github.com/pobredux/pob-redux/releases/download/v$pkgver/PoB.Redux_${pkgver}_arm64.deb")
sha256sums=('1724147fdca0d7d5be9f05217865af65e595ff3d17c8bcbd58683fe23e8909f7')
sha256sums_x86_64=('22e53f3be3c155c53ff285cf8af0688df04ee31199ab1d0d83e8277c786b74ef')
sha256sums_aarch64=('e6f33d7ff1320cf58aabb30d606990f8e1b4fbc4c823ce2725ba63268f9ca5c1')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
